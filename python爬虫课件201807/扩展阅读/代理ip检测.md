# 代理ip检测

## 目标
* 能够使用requests模块检测代理ip
* 能够在selenium中检测代理ip
* 能够在scrapy中检测代理ip

## 0. retrying模块使用demo

```python
import requests
from retrying import retry

headers = {}

@retry(stop_max_attempt_number=3) #最大重试3次，3次全部报错，才会报错
def parse_url(url)
    response = requests.get(url, headers=headers, timeout=3) #超时的时候会报错并重试
    assert response.status_code == 200 #状态码不是200，也会报错并重试
    return response
```

## 1. 使用requests模块配合retrying使用并检测代理ip
通过设置超时时间和判断响应的状态码来检测代理ip
```python
import requests
from retrying import retry

proxy_list = [] # 静态代理ip池

@retry(stop_max_attempt_number=3) #最大重试3次，3次全部报错，最终才会抛出异常
def parse_url(url, headers)
    proxies = random.choice(proxy_list) # 直接从静态代理ip池随机获取一个代理ip
    # proxies = json.loads(requests.get(proxy_url)) # 从代理ip的webapi获取一个代理ip的json字符串
    response = requests.get(url, headers=headers, timeout=3, proxies=proxies) # 向目标url发送请求，超时的时候会报错并重试
    assert response.status_code == 200 # 状态码不是200，也会报错并重试
    return response # 直到成功才会返回响应
```

## 2. 在selenium.webdriver中使用并检测代理ip
在selenium当中因为不能直接获取响应的状态码，所以一般对page_source进行判断，而下面的方法则通过selenium的日志来强行获取状态码，进而检测代理ip是否好用
```python
import json
import traceback
import random
import requests
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

def getHttpStatus(dirver): # 专门获取selenium的响应状态码的方法
    for responseReceived in dirver.get_log('performance'):
        try:
            response = json.loads(responseReceived[u'message'])[u'message'][u'params'][u'response']
            if response[u'url'] == dirver.current_url:
                return (response[u'status'], response[u'statusText'])
        except:
            pass
    return (None, 'TIMEOUT')

def getProxy(): # 获取代理ip的函数,返回一个包含协议的代理ip字符串
    # 通过webapi获取代理ip
    # proxy_url = 'http://proxy_url:8000'
    # proxy = requests.get(proxy_url)

    # 或通过静态代理ip池(列表)随即获取代理ip, proxy_list需要导入
    # proxy = random.choice(proxy_list)
    ...
    return proxy # proxy = "http://202.20.16.82:10152"

def getDriver():
    # 设置项:为了从log中获取status
    d = DesiredCapabilities.CHROME
    d['loggingPrefs'] = {'performance': 'ALL'}

    # 设置代理ip
    chromeOptions = webdriver.ChromeOptions()
    proxy = getProxy()
    driver_proxy = "--proxy-server={}".format(proxy)
    # 一定要注意，=两边不能有空格，不能是这样--proxy-server = http://202.20.16.82:10152
    chromeOptions.add_argument(driver_proxy) # "--proxy-server=http://202.20.16.82:10152"

    # 获取一个driver对象,并加载各项设置
    driver = webdriver.Chrome(executable_path='/home/worker/Desktop/driver/chromedriver',
                              desired_capabilities=d,
                              chrome_options=chromeOptions)

    # 下面这两种设置都进行 超时设置才会有效
    # driver.set_page_load_timeout(10) # 设置html页面加载时间
    # driver.set_script_timeout(10) # 设置js加载时间

    return driver

# 目标url
url = 'http://www.baidu.com/'

driver = getDriver() # 获取使用代理ip的driver

try:
    driver.get(url) # 向目标url发送请求
    print(type(getHttpStatus(driver)))
    print(getHttpStatus(driver)[0])
    assert getHttpStatus(driver)[0] == 200 # 获取响应状态码如果不是200,就会抛出异常
except Exception as e:
    print(e)
    print(traceback.format_exc())
finally:
    driver.quit()
```

## 3. scrapy中检测代理ip
在使用了代理ip的情况下可以在下载中间件的process_response()方法中处理代理ip的使用情况：
  ```python
  class ProxyMiddleware(object):
      def process_response(self, request, response, spider):
          if response.status != 200 and response.status != 302:
              return request
  ```
  如果response.status不等于200或302，那么说明该次请求失败；此时通过return request通知引擎重新发送该请求，并可以在process_request()方法中使用新的代理ip，关键词：`scrapy.Request的meta参数`、`meta['proxy]`


## 4. 生产环境下的代理ip检测
生产环境下，我们会通过很多方式准备的代理ip可以有很多思路进行代理的检测

下面是关于代理ip质量的检测可以有下面几种思路：
    - 专门使用一个程序检测代理ip中的代理质量
    - 是在使用的时候如果代理ip不可用，可以使用web端提供的api接口进行反馈，在web后端进行代理ip的删除操作等
    - 是在使用的时候如果代理ip不可用，直接打印日志，日志推消息总线 专门的代理ip统计服务再去处理

代理ip检测的目的就是能够返回一个ip地址，在ip地址不可用的时候能够返回一个新的打理ip

