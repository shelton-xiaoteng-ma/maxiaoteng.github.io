## scrapy配置

## 配置优先级
1. 命令行选项 -s 最高
    ```
    scrapy crawl myspider -s LOG_FILE=scrapy.log
    ```
2. 每个spider的custom_settings
    ```
    class Spider(RedisSpider):
        name = 'spider_name'
        redis_key = xxx
        custom_settings = {
            'REDIRECT_ENABLED': True,
            'COOKIES_ENABLED': True,
            }
    ```
3. settings.py
4. 每个命令的默认setting
5. 默认的setting


## settings.py配置
1. 网站爬虫规则，关闭robots.txt遵循
    ```
    # Obey robots.txt rules
    ROBOTSTXT_OBEY = False
    ```

2. 下载延迟
    ```
    import random  
    DOWNLOAD_DELAY = random.randint(1, 2)
    ```

3. 并发
    ```
    CONCURRENT_REQUESTS = 64

    ```

4. 是否启用cookie  
    ```
    # COOKIES_ENABLED = False # 默认生效中，像浏览器一样，一般无需管理  
    COOKIES_ENABLED = True  # 如果使用自定义cookie就把COOKIES_ENABLED设置为True  
    COOKIES_ENABLED = False   # 如果使用settings的cookie就把COOKIES_ENABLED设置为False  
    ```

5. extensions  
    ```
    EXTENSIONS = {
        'scrapy.extensions.telnet.TelnetConsole': None,
        # CloseSpiderRedis是设置redis没有任务后自动关闭的扩展, 如果不用bo_lib, 需要手动加入(见[extensions.md](extensions.md))
        'bo_lib.scrapy_tools.CloseSpiderRedis': 100,
    }
    CLOSE_SPIDER_AFTER_IDLE_TIMES = 5  
    ```

6. ITEM的处理(pipeline)
    ```  
    ITEM_PIPELINES = {
    	# 'weapon.pipelines.WeaponPipeline': 300,
    	# 'weapon.mongoPipeline.MongoPipeline': 301,
    	'weapon.mysql_pipelines.MySQLPipeline': 301,
	}
    ```

5. 文件编码  
    FEED_EXPORT_ENCODING = 'utf-8'

6. LOG的配置  
    LOG_ENCODING = 'UTF-8'
    
7. 数据库配置  
	```
    MYSQL_HOST = 'localhost'  
	MYSQL_DATABASE = 'military'  
	MYSQL_POST = 3306  
	MYSQL_USER = 'root'  
	# MYSQL_PASSWORD = ''  
	MYSQL_PASSWORD = 'PnS_cDEZhMb4p8M3'  
	# mongodb配置  
	MONGO_URI = "localhost:27017"  
	MONGO_DATABASE = 'military'  
	```
	
8. 配置数据版本VERSION
    ```
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    
    VERSION = date
    ```

9. 配置item pipelines
    ```
    # Configure item pipelines
    
    ITEM_PIPELINES = {
       'mangoplate_scrapy.pipelines.MangoplateScrapyPipeline': 300,
    }
    ```

10. 配置自动限速

    下载延迟计算: 通过计算建立TCP连接到接收HTTP header之间的时间来测量的.
    
    自动计算来确定合理的延迟和并发数, 注意: 
    - 'CONCURRENT_REQUESTS_PER_DOMAIN' 计算出的并发不高于预设置的
    - 'CONCURRENT_REQUESTS_PER_IP' 计算出的并发不高于预设置的
    - 'DOWNLOAD_DELAY' 计算出的延迟不会低于预设置的
    
    ```
    # Enable and configure the AutoThrottle extension (disabled by default)
    # See https://doc.scrapy.org/en/latest/topics/autothrottle.html
    AUTOTHROTTLE_ENABLED = True  # 启用自动限速扩展
    # The initial download delay
    AUTOTHROTTLE_START_DELAY = 5  # 初始下载延迟
    # The maximum download delay to be set in case of high latencies
    AUTOTHROTTLE_MAX_DELAY = 60 # 高延迟情况下最大的下载延迟
    # The average number of requests Scrapy should be sending in parallel to each remote server
    AUTOTHROTTLE_TARGET_CONCURRENCY = 1.0  # 开启时的并发
    # Enable showing throttling stats for every response received:
    AUTOTHROTTLE_DEBUG = False  # debug模式, true将会展示每个接收到的response, 可以查看限速参数是如何调整的.
    ```

11. log配置
    ```
    cur_dir = os.path.dirname(os.path.realpath(__file__))
    logFilename = os.path.join(cur_dir, '../../crawlerOutput/{}/log/roundmenu.log'.format(VERSION))
    logging.basicConfig(
      level=logging.ERROR,  # 定义输出到文件的log级别，
      format='%(asctime)s  %(filename)s : %(levelname)s  %(message)s',  # 定义输出log的格式
      datefmt='%Y-%m-%d %A %H:%M:%S',  # 时间
      filename=logFilename,  # log文件名
      filemode='a')
    
    FEED_EXPORT_ENCODING = 'UTF-8'
    ```
12. 请求超时
    ```python
    # 设置超时，默认180秒
    DOWNLOAD_TIMEOUT = 10
    ```
13. 处理HTTP错误
    ```
    # 默认为[], 即所有的httperror请求调用errback, 配置后对应的响应将调用callback
    HTTPERROR_ALLOWED_CODES = [302, 404]

    # 默认False
    HTTPERROR_ALLOW_ALL = TRUE

    # spider中可以用
    handle_httpstatus_list = [404]
    ```

14. scrapy_redis
    ```python
    # scrapy_redis 默认有 REDIS_PARAMS 这个参数，且会自动将你的 REDIS_PARAMS 用你的指定的值更新。所以我们可以这样写
    REDIS_PARAMS = {
        'db': 11,
        'use_helper': True,
    }
    ```

