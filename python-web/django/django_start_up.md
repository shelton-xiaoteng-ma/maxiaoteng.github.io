# 开始一个项目

## 0安装: 
```
sudo pip install Django
sudo python -m pip install Django
```

1. 开发流程
   - 搭建开发环境
   - 创建Django工程, 基础设置(数据库版本, 模板路径, 语言等), 创建超级用户
   - 建立应用app, 并注册到setting
   - 创建数据库模型models, 迁移数据库
   - 设计app需要的urls, 添加到工程的urls中
   - 设计url对应的视图函数views, 编辑需要的模板

2. 部署流程
   - clone代码
   - 启动虚拟环境, 安装依赖
   - 收集静态文件

## 1. 准备目录
```
mkdir mysite
cd mysite
```

## 2. 创建虚拟环境
```
virtualenv --no-site-packages venv
source venv/bin/activate
# 安装包
pip -r requirement.txt
```

## 3. 创建django项目
```
django-admin startproject mysite
cd mysit
# 可以指定应用访问的web ip和端口
python36 manage.py runserver 0:8000 
```
开发服务器自动重载代码的修改, 但是文件的添加需要重启.

django提供了自动生成一个app的目录结构的功能.


## 4. 创建一个app

```
python manage.py startapp polls
# 将会创建出一个目录
```

- app文件夹结构
```
blog\
    __init__.py
    admin.py
    apps.py
    migrations\
        __init__.py
    models.py
    tests.py
    views.py
```

- 配置文件中注册应用
```
blogproject/blogproject/settings.py
## 其他配置项...
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog', # 注册 blog 应用
]
## 其他配置项..
```

## 5. 创建Models[models.md](./models.md)

## 6. 配置views[views.md](./views.md)

## 7. 配置urls[urls.md](./urls.md)

## 8. 初始化数据库
    ```
    python manage.py makemigrations

    python manage.py migrate
    ```

## 9. 启动服务
`python3 manage.py runserver localhost:8000`

## 10. 调试
`python manage.py shell`

## 11. 设置[settings.md](settings.md)
