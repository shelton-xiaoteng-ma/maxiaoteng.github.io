# 开始一个scrapy

```
scrapy startproject my_scrapy

cd my_scrapy

scrapy genspider -t basic first_spider xx.com

scrapy list

scrapy crawl first_spider  
```

## scrapy
```
scrapy
#等价于
/usr/bin/python36 /usr/local/bin/scrapy
# 所以可以使用这种方法来指定python版本
```


## spider传入参数
```
scrapy crawl spider1 -a params
```