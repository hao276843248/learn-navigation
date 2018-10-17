## ImagesPipeline管道(自动图片下载)

Scrapy提供了一个 item pipeline ，来下载属于某个特定项目的图片，比如，当你抓取产品时，也想把它们的图片下载到本地。本文接豆瓣top250电影，爬取海报图片。


### 一、ImagesPipeline的工作流程
首先在爬虫项目中获取图片的image_urls
item[‘image_urls’]进入管道中
当项目进入 ImagesPipeline，image_urls 组内的URLs将被Scrapy的调度器和下载器（这意味着调度器和下载器的中间件可以复用）安排下载
下载完回返回一个results，这是一个二组，包括success(布尔值，提示图片是否下载成功)和image_info_or_error(图片下载的url，图片存储的路径，图片内容的 MD5 hash)

### 二、ImagesPipeline的使用
1.首先在item.py中写入

```
import scrapy

class MyItem(scrapy.Item):

    image_urls = scrapy.Field()  #保存图片地址
    images = scrapy.Field()      #保存图片的信息
```
2.在setting.py中写入
```
ITEM_PIPELINES = { 'top250.pipelines.Top250Pipeline': 1,}
IMAGES_STORE = 'images'   #存储图片的文件夹位置
```

3.在pipeline中写入
```
class Top250Pipeline(ImagesPipeline):

    def get_media_requests(self, item, info):
        for image_url in item['image_urls']:
            yield scrapy.Request(image_url)

    def item_completed(self, results, item, info):
        image_paths = [x['path'] for ok, x in results if ok]      # ok判断是否下载成功
        if not image_paths:
            raise DropItem("Item contains no images")
        #item['image_paths'] = image_paths
        return item
```


