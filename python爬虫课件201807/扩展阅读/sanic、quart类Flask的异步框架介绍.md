# sanic、quart类Flask的异步框架介绍

## 目标
* 知道sanic、quart框架

## 1. sanic (索尼克)
sanci是一个异步的web框架，仅支持python3.5+
通过`python3 -m pip install sanic`等方法安装
中文文档地址：https://www.beibq.cn/book/xgwl906-16543
```python
from sanic import Sanic
from sanic.response import text

app = Sanic(__name__)

@app.route("/")
async def test(request):
    return text('Hello world!')
    
app.run(host="0.0.0.0", port=8000, debug=True)
```
是不是长的和Flask很像？还有更像的！看下面

## 2. quart
* quart是基于asyncio的Python微框架。它志在让开发者能够在Web开发中很容易地得到asyncio带来的好处。它对Flask应用的支持最好，它和Flask拥有相同的API。
* 支持 HTTP/1.1，HTTP/2 和 Websockets。quart扩展性很强，并支持很多Flask扩展（希望将来会出现针对Quart的扩展）。
* 仅支持python3.6+
* 安装：`python3 -m pip install quart`

```python
from quart import Quart, websocket
app = Quart(__name__)

@app.route('/')
async def hello():
    return 'hello'
    
@app.websocket('/ws')
async def ws():
    while True:
        await websocket.send('hello')
        
app.run()
```

**quart的文档**：https://pgjones.gitlab.io/quart/ （很遗憾不是中文的，等待少年你来发扬光大了！）


## 小结
- 本小结重点
    - 知道sanic、quart框架