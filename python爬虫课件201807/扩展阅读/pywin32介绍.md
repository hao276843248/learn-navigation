## pywin32介绍
##### 学习目标：
了解 pywin32的使用场景
_________________

### 1. pywin32从驱动层模拟键盘鼠标的输入！

> 比如我们打算写一个 某银行网银登陆 的爬虫，因为该银行网站的ActiveX控件的限制，只能在win环境下使用ie浏览器，简单测试代码如下

```
# 这是错误示例
from selenium import webdriver

class Loginer(object):

    def __init__(self, username):
        self.username = username
        iedriver = '.\IEDriverServer.exe'  # iedriver路径
        self.driver = webdriver.Ie(iedriver)
        self.driver.delete_all_cookies()
        self.driver.get('https://perbank.abchina.com/EbankSite/startup.do')

    def input_name(self):
        input('准备输入用户名！')
        self.driver.find_element_by_id('username').send_keys(self.username)

if __name__ == '__main__':
    username = 'testlogin'
    login = Loginer(username)
    login.input_name()
```
**现象：各种报错！无论是否加载控件都不能输入账号！**
短时间又搞不定activeX加密控件！网站有高级反爬，这就是那剩下5%的网站其中之一！此时我们怎么办呢？

> 看这个文件！input_key.py我们**可以从驱动层模拟鼠标键盘的动作**！

注意：
1. 需要手动调整ie浏览器的位置或调整代码中的坐标参数
2. 被selenium控制的ie浏览器必须调整为100%大小比例

```
import win32api  
import win32con  
import win32gui  
from ctypes import *  
import time  
  
VK_CODE = {  
    'backspace':0x08,  
    'tab':0x09,  
    'clear':0x0C,  
    'enter':0x0D,  
    'shift':0x10,  
    'ctrl':0x11,  
    'alt':0x12,  
    'pause':0x13,  
    'caps_lock':0x14,  
    'esc':0x1B,  
    'spacebar':0x20,  
    'page_up':0x21,  
    'page_down':0x22,  
    'end':0x23,  
    'home':0x24,  
    'left_arrow':0x25,  
    'up_arrow':0x26,  
    'right_arrow':0x27,  
    'down_arrow':0x28,  
    'select':0x29,  
    'print':0x2A,  
    'execute':0x2B,  
    'print_screen':0x2C,  
    'ins':0x2D,  
    'del':0x2E,  
    'help':0x2F,  
    '0':0x30,  
    '1':0x31,  
    '2':0x32,  
    '3':0x33,  
    '4':0x34,  
    '5':0x35,  
    '6':0x36,  
    '7':0x37,  
    '8':0x38,  
    '9':0x39,  
    'a':0x41,  
    'b':0x42,  
    'c':0x43,  
    'd':0x44,  
    'e':0x45,  
    'f':0x46,  
    'g':0x47,  
    'h':0x48,  
    'i':0x49,  
    'j':0x4A,  
    'k':0x4B,  
    'l':0x4C,  
    'm':0x4D,  
    'n':0x4E,  
    'o':0x4F,  
    'p':0x50,  
    'q':0x51,  
    'r':0x52,  
    's':0x53,  
    't':0x54,  
    'u':0x55,  
    'v':0x56,  
    'w':0x57,  
    'x':0x58,  
    'y':0x59,  
    'z':0x5A,  
    'numpad_0':0x60,  
    'numpad_1':0x61,  
    'numpad_2':0x62,  
    'numpad_3':0x63,  
    'numpad_4':0x64,  
    'numpad_5':0x65,  
    'numpad_6':0x66,  
    'numpad_7':0x67,  
    'numpad_8':0x68,  
    'numpad_9':0x69,  
    'multiply_key':0x6A,  
    'add_key':0x6B,  
    'separator_key':0x6C,  
    'subtract_key':0x6D,  
    'decimal_key':0x6E,  
    'divide_key':0x6F,  
    'F1':0x70,  
    'F2':0x71,  
    'F3':0x72,  
    'F4':0x73,  
    'F5':0x74,  
    'F6':0x75,  
    'F7':0x76,  
    'F8':0x77,  
    'F9':0x78,  
    'F10':0x79,  
    'F11':0x7A,  
    'F12':0x7B,  
    'F13':0x7C,  
    'F14':0x7D,  
    'F15':0x7E,  
    'F16':0x7F,  
    'F17':0x80,  
    'F18':0x81,  
    'F19':0x82,  
    'F20':0x83,  
    'F21':0x84,  
    'F22':0x85,  
    'F23':0x86,  
    'F24':0x87,  
    'num_lock':0x90,  
    'scroll_lock':0x91,  
    'left_shift':0xA0,  
    'right_shift ':0xA1,  
    'left_control':0xA2,  
    'right_control':0xA3,  
    'left_menu':0xA4,  
    'right_menu':0xA5,  
    'browser_back':0xA6,  
    'browser_forward':0xA7,  
    'browser_refresh':0xA8,  
    'browser_stop':0xA9,  
    'browser_search':0xAA,  
    'browser_favorites':0xAB,  
    'browser_start_and_home':0xAC,  
    'volume_mute':0xAD,  
    'volume_Down':0xAE,  
    'volume_up':0xAF,  
    'next_track':0xB0,  
    'previous_track':0xB1,  
    'stop_media':0xB2,  
    'play/pause_media':0xB3,  
    'start_mail':0xB4,  
    'select_media':0xB5,  
    'start_application_1':0xB6,  
    'start_application_2':0xB7,  
    'attn_key':0xF6,  
    'crsel_key':0xF7,  
    'exsel_key':0xF8,  
    'play_key':0xFA,  
    'zoom_key':0xFB,  
    'clear_key':0xFE,  
    '+':0xBB,  
    ',':0xBC,  
    '-':0xBD,  
    '.':0xBE,  
    '/':0xBF,  
    "`":0xC0,
    ';':0xBA,  
    '[':0xDB,  
    '\\':0xDC,  
    ']':0xDD,  
    "'":0xDE,  
    '`':0xC0}  
  
class POINT(Structure):  
    _fields_ = [("x", c_ulong),("y", c_ulong)]  
  
def get_mouse_point():  
    po = POINT()  
    windll.user32.GetCursorPos(byref(po))  
    return int(po.x), int(po.y)  
  
def mouse_click(x=None,y=None):  
    if not x is None and not y is None:  
        mouse_move(x,y)  
        time.sleep(0.05)  
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)  
    time.sleep(0.05)
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
  
def mouse_dclick(x=None,y=None):  
    if not x is None and not y is None:  
        mouse_move(x,y)  
        time.sleep(0.05)  
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)  
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)  
  
def mouse_move(x,y):  
    windll.user32.SetCursorPos(x, y)  
  
def key_input(str=''):  
    for c in str:  
        win32api.keybd_event(VK_CODE[c],0,0,0)  
        win32api.keybd_event(VK_CODE[c],0,win32con.KEYEVENTF_KEYUP,0)  
        time.sleep(0.01)  
  
def t0():  
    pass  
  
def t2():  
    mouse_click(800,200)  
    for c in 'hello':  
        win32api.keybd_event(65,0,0,0) #a键位码是86  
        win32api.keybd_event(65,0,win32con.KEYEVENTF_KEYUP,0)  
    #print get_mouse_point()  
  
def t1():  
    #mouse_move(1024,470)aa  
    #time.sleep(0.05)  
    #mouse_dclick()HELLO  
    mouse_dclick(1024,470)  
  
def t3():  
    mouse_click(1024,470)  
    str = 'hello'  
    for c in str:  
        win32api.keybd_event(VK_CODE[c],0,0,0) #a键位码是86  
        win32api.keybd_event(VK_CODE[c],0,win32con.KEYEVENTF_KEYUP,0)  
        time.sleep(0.01)  

def t4(str, x, y):
    mouse_click(x, y)
    key_input(str)
  
if __name__ == "__main__":  
    
    # 100 350是坐标参数，需要调整！
    t4('aaa', 100, 350) # 在这里进行测试输出位置！
```

打开ie浏览器某网银登陆界面，只要不断的调试函数中的X,Y坐标和IE浏览器的位置就可以进行模拟输入进而登陆！

### 2. **注意** `pip install pywin32`安装之后 是这样的三个包：

```
import win32api  
import win32con  
import win32gui 
```

### 3. pywin32的搜索关键词
上边的那个只是初步的解决方案！更完美的解决方法我们需要了解几个关键词！
* 句柄
* 外挂
* 后台

可以通过pywein32包拿到ie浏览器的句柄，就可以随时获取ie的坐标，这样就不怕浏览器的位置发生改变了，也就不需要调整ie浏览器的位置，更不需要调整xy坐标参数了！
并且我们可以用pywin32包控制鼠标键盘的动作为后台运行，这样就不影响鼠标键盘的正常使用了

### 4. pywin32的demo
1. lib的site-packages下面的win32目录下，有一个demos。另外几个win32开头的目录里也有demos子目录。进去看他们写好的例子

2. 想要了解更多关于python的window系统编程，请自行搜索
3. 了解更多spy++  https://my.oschina.net/yangyanxing/blog/167042

### 5. 其他脑洞大开的方案
> selenium控制浏览器
> 利用pywin32控制抓包工具Fiddler
> 截图或直接获取Fiddler中抓到的数据

另外一种名为wireshark的抓包工具是有python版本的api的 ：wspy_dissector

### 小结
了解pywin32的使用场景