# urllib中Handler处理器 和 自定义Opener

##Handler处理器 和 自定义Opener
opener是 urllib2.OpenerDirector 的实例，我们之前一直都在使用的urlopen，它是一个特殊的opener（也就是模块帮我们构建好的）。

但是基本的urlopen()方法不支持代理、Cookie等其他的 HTTP/HTTPS高级功能。所以要支持这些功能：
```
1.使用相关的 Handler处理器 来创建特定功能的处理器对象；

2.然后通过 urllib2.build_opener()方法使用这些处理器对象，创建自定义opener对象；

3.使用自定义的opener对象，调用open()方法发送请求。

4.注意：如果程序里所有的请求都使用自定义的opener，可以使用urllib2.install_opener() 将自定义的 opener 对象 定义为 全局opener，表示如果之后凡是调用urlopen，都将使用这个opener（根据自己的需求来选择）。
```

### 简单的自定义opener()
```
import urllib2

# 构建一个HTTPHandler 处理器对象，支持处理HTTP请求
http_handler = urllib2.HTTPHandler()


# 调用urllib2.build_opener()方法，创建支持处理HTTP请求的opener对象
opener = urllib2.build_opener(http_handler)

# 构建 Request请求
request = urllib2.Request("http://www.baidu.com/")

# 调用自定义opener对象的open()方法，发送request请求
# （注意区别：不再通过urllib2.urlopen()发送请求）
response = opener.open(request)

# 获取服务器响应内容
print response.read()

```

### ProxyHandler处理器（代理设置）

```

import urllib2

# 构建了两个代理Handler，一个有代理IP，一个没有代理IP
httpproxy_handler = urllib2.ProxyHandler({"http" : "124.88.67.81:80"})
nullproxy_handler = urllib2.ProxyHandler({})

proxySwitch = True #定义一个代理开关

# 通过 urllib2.build_opener()方法使用这些代理Handler对象，创建自定义opener对象
# 根据代理开关是否打开，使用不同的代理模式
if proxySwitch:  
    opener = urllib2.build_opener(httpproxy_handler)
else:
    opener = urllib2.build_opener(nullproxy_handler)

request = urllib2.Request("http://www.baidu.com/")

# 1. 如果这么写，只有使用opener.open()方法发送请求才使用自定义的代理，而urlopen()则不使用自定义代理。
response = opener.open(request)

# 2. 如果这么写，就是将opener应用到全局，之后所有的，不管是opener.open()还是urlopen() 发送请求，都将使用自定义代理。
# urllib2.install_opener(opener)
# response = urlopen(request)

print response.read()

```

### Cookie设置
在Python处理Cookie，一般是通过cookielib模块和 urllib2模块的HTTPCookieProcessor处理器类一起使用。

cookielib模块：主要作用是提供用于存储cookie的对象

HTTPCookieProcessor处理器：主要作用是处理这些cookie对象，并构建handler对象。

```

import urllib
import urllib2
import cookielib

# 1. 构建一个CookieJar对象实例来保存cookie
cookie = cookielib.CookieJar()

# 2. 使用HTTPCookieProcessor()来创建cookie处理器对象，参数为CookieJar()对象
cookie_handler = urllib2.HTTPCookieProcessor(cookie)

# 3. 通过 build_opener() 来构建opener
opener = urllib2.build_opener(cookie_handler)

# 4. addheaders 接受一个列表，里面每个元素都是一个headers信息的元祖, opener将附带headers信息
opener.addheaders = [("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36")]

# 5. 需要登录的账户和密码
data = {"email":"", "password":""}  

# 6. 通过urlencode()转码
postdata = urllib.urlencode(data)

# 7. 构建Request请求对象，包含需要发送的用户名和密码
request = urllib2.Request("http://www.xxx.com/PLogin.do", data = postdata)

# 8. 通过opener发送这个请求，并获取登录后的Cookie值，
opener.open(request)                                              

# 9. opener包含用户登录后的Cookie值，可以直接访问那些登录后才可以访问的页面
response = opener.open("http://www.xxxx.com/")  

# 10. 打印响应内容
print response.read()

```

