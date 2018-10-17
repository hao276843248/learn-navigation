## selenium深入拓展
##### 学习目标：
1. 了解 selenium处理下拉表单
2. 了解 selenium的ActionChains类
_________________

### 1. selenium处理下拉表单
Selenium专门提供了Select类来处理下拉框。 其实 WebDriver 中提供了一个叫 Select 的方法，可以帮助我们完成这些事情：
```
# 导入 Select 类
from selenium.webdriver.support.ui import Select

# 找到 name 的选项卡
select = Select(driver.find_element_by_name('status'))

select.select_by_index(1)
select.select_by_value("0")
select.select_by_visible_text(u"文本内容")
```

以上是三种选择下拉框的方式，它可以根据索引来选择，可以根据值来选择，可以根据文字来选择。注意：

    index 索引从 0 开始
    value是option标签的一个属性值，并不是显示在下拉框中的值
    visible_text是在option标签文本的值，是显示在下拉框的值

全部取消选择怎么办呢？很简单:
```
select.deselect_all()
```

### 2.ActionChains类
> ActionChains类可以模拟各种各样的鼠标以及键盘操作

#### 2.1 selenium的ActionChains类使用场景
有时候会遇到需要模拟鼠标操作才能进行的情况，比如单击、双击、点击鼠标右键、拖拽等等。而selenium给我们提供了一个类来处理这类事件——ActionChains

#### 2.2 ActionChains基本用法

首先需要了解ActionChains的执行原理，当你调用ActionChains的方法时，不会立即执行，而是会将所有的操作按顺序存放在一个队列里，当你调用perform()方法时，队列中的时间会依次执行。

##### 2.2.1 链式写法

```
menu = driver.find_element_by_css_selector(".nav")
hidden_submenu =  driver.find_element_by_css_selector(".nav #submenu1")
 
ActionChains(driver).move_to_element(menu).click(hidden_submenu).perform()
```

##### 2.2.2 分步写法
```
menu = driver.find_element_by_css_selector(".nav")
hidden_submenu = driver.find_element_by_css_selector(".nav #submenu1")
 
actions = ActionChains(driver)
actions.move_to_element(menu)
actions.click(hidden_submenu)
actions.perform()
```

#### 2.3 代码示例

##### 2.3.1 点击操作
```
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from time import sleep
 
driver = webdriver.Chrome()
driver.implicitly_wait(10)
driver.maximize_window()
driver.get('http://sahitest.com/demo/clicks.htm')
 
click_btn = driver.find_element_by_xpath('//input[@value="click me"]') # 单击按钮
doubleclick_btn = driver.find_element_by_xpath('//input[@value="dbl click me"]') # 双击按钮
rightclick_btn = driver.find_element_by_xpath('//input[@value="right click me"]') # 右键单击按钮
 
ActionChains(driver).click(click_btn).double_click(doubleclick_btn).context_click(rightclick_btn).perform() # 链式用法
 
print driver.find_element_by_name('t2').get_attribute('value')
 
sleep(2)
driver.quit()
```

##### 2.3.2 鼠标移动
```
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from time import sleep
 
driver = webdriver.Firefox()
driver.implicitly_wait(10)
driver.maximize_window()
driver.get('http://sahitest.com/demo/mouseover.htm')
 
write = driver.find_element_by_xpath('//input[@value="Write on hover"]') # 鼠标移动到此元素，在下面的input框中会显示“Mouse moved”
blank = driver.find_element_by_xpath('//input[@value="Blank on hover"]') # 鼠标移动到此元素，会清空下面input框中的内容
 
result = driver.find_element_by_name('t1')
 
action = ActionChains(driver)
action.move_to_element(write).perform() # 移动到write，显示“Mouse moved”
print result.get_attribute('value')
 
# action.move_to_element(blank).perform()
action.move_by_offset(10, 50).perform() # 移动到距离当前位置(10,50)的点，与上句效果相同，移动到blank上，清空
print result.get_attribute('value')
 
action.move_to_element_with_offset(blank, 10, -40).perform() # 移动到距离blank元素(10,-40)的点，可移动到write上
print result.get_attribute('value')
 
sleep(2)
driver.quit()
```

##### 2.3.3 拖拽
```
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from time import sleep
 
driver = webdriver.Firefox()
driver.implicitly_wait(10)
driver.maximize_window()
driver.get('http://sahitest.com/demo/dragDropMooTools.htm')
 
dragger = driver.find_element_by_id('dragger') # 被拖拽元素
item1 = driver.find_element_by_xpath('//div[text()="Item 1"]') # 目标元素1
item2 = driver.find_element_by_xpath('//div[text()="Item 2"]') # 目标2
item3 = driver.find_element_by_xpath('//div[text()="Item 3"]') # 目标3
item4 = driver.find_element_by_xpath('//div[text()="Item 4"]') # 目标4
 
action = ActionChains(driver)
action.drag_and_drop(dragger, item1).perform() # 1.移动dragger到目标1
sleep(2)
action.click_and_hold(dragger).release(item2).perform() # 2.效果与上句相同，也能起到移动效果
sleep(2)
action.click_and_hold(dragger).move_to_element(item3).release().perform() # 3.效果与上两句相同，也能起到移动的效果
sleep(2)
# action.drag_and_drop_by_offset(dragger, 400, 150).perform() # 4.移动到指定坐标
action.click_and_hold(dragger).move_by_offset(400, 150).release().perform() # 5.与上一句相同，移动到指定坐标
sleep(2)
driver.quit()
```

##### 2.3.4 按键
```
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from time import sleep
 
driver = webdriver.Firefox()
driver.implicitly_wait(10)
driver.maximize_window()
 
driver.get('http://sahitest.com/demo/label.htm')
 
input1 = driver.find_elements_by_tag_name('input')[3]
input2 = driver.find_elements_by_tag_name('input')[4]
 
action = ActionChains(driver)
input1.click()
action.send_keys('Test Keys').perform()
action.key_down(Keys.CONTROL).send_keys('a').key_up(Keys.CONTROL).perform() # ctrl+a
action.key_down(Keys.CONTROL).send_keys('c').key_up(Keys.CONTROL).perform() # ctrl+c
 
action.key_down(Keys.CONTROL, input2).send_keys('v').key_up(Keys.CONTROL).perform() # ctrl+v
 
print input1.get_attribute('value')
print input2.get_attribute('value')
 
driver.quit()
```

#### 2.4 ActionChains方法列表

1. click(on_element=None) ——单击鼠标左键
2. click_and_hold(on_element=None) ——点击鼠标左键，不松开
3. context_click(on_element=None) ——点击鼠标右键
4. double_click(on_element=None) ——双击鼠标左键
5. drag_and_drop(source, target) ——拖拽到某个元素然后松开
6. drag_and_drop_by_offset(source, xoffset, yoffset) ——拖拽到某个坐标然后松开
7. key_down(value, element=None) ——按下某个键盘上的键
8. key_up(value, element=None) ——松开某个键
9. move_by_offset(xoffset, yoffset) ——鼠标从当前位置移动到某个坐标
10. move_to_element(to_element) ——鼠标移动到某个元素
11. move_to_element_with_offset(to_element, xoffset, yoffset) ——移动到距某个元素（左上角坐标）多少距离的位置
12. perform() ——执行链中的所有动作
13. release(on_element=None) ——在某个元素位置松开鼠标左键
14. send_keys(keys_to_send) ——发送某个键到当前焦点的元素
15. send_keys_to_element(element, keys_to_send) ——发送某个键到指定元素 


#### 3. selenium还可以录制python脚本
> 参考阅读：
> https://www.cnblogs.com/changLF/p/6621946.html

### 小结
1. 了解selenium处理下拉表单
2. 了解selenium的ActionChains类