
# 包管理和虚拟环境

- 包安装方法    
通过Python社区开发的pip, easy_install等工具   
使用系统本身自带的包管理器(yum, apt-get)      
通过源码安装     


## 1. virtualenv安装  
虚拟环境的包是对真实环境包的一个复制  
1. virtualenv默认有python可执行文件, 常用标准库等.
    ```
    sudo pip install virtualenv  # 安装virtualenv

    # 创建一个project
    mkdir project
    cd project
    virtualenv venv  # 启动一个虚拟环境(名为:venv, 也可以带一些路径, 默认当前文件夹), 默认复制系统所有的第三方包
    virtualenv --no-site-packages venv  # 启动一个虚拟环境
    virtualenv venv --python=python3.6
    ,不包含任何第三方包
    source venv/bin/activate  # 生效一个虚拟环境
    (venv)>which python
    > /home.../bin/python
    (venv)>deactivate  # 退出虚拟环境
    ```
2. windows启动虚拟环境
    ```
    # 直接命令行运行active文件执行
    C:\Users\jizhu>task\mxt_blogs\Scripts\activate
    (mxt_blogs) C:\Users\jizhu>
    ```

## 2. pip 包管理

1. 说明

2. 使用

    ```
        # 列出
        pip list  # 列出所有的第三方包
        pip freeze > requirement.txt  # 导出当前环境下的所有第三方包
        
        # 安装
        pip install requests  # 安装包
        pip install requests==3.6.0  
        pip install -r requirement.txt  # 根据配置文件生成相同的环境

        # 卸载
        pip uninstall requests 
        pip uninstall -r requirements.txt

        # 升级
        pip install -U requests  
        pip install -U pip  # 升级pip

        # 显示包所在目录
        pip show -f requests

        # 搜索包
        pip search <搜索关键字>

        # 查询可升级的包
        pip list -o

        # 下载包而不安装
        pip install <包名> -d <目录>
        pip install -d <目录> -r requirements.txt

        # 打包
        pip wheel <包名>

    ```
    有的环境中, python3/2与pip没有绑定, 用pip/pip3 或python -m pip

3. 指定安装源
    1. 单次安装源
    ```
        pip install <包名> -i http://pypi.douban.com/simple
    ```
    2. 全局修改
        1. unix和macos: $HOME/.pip/pip.conf
        2. windows: %HOME%\pip\pip.ini
    ```
        [global]
        timeout = 6000
        index-url = http://pypi.douban.com/simple
    ```

## 3. pipenv

是python项目的依赖管理器
- 根据pipfile自动寻找项目根目录
- 如果不存在,自动生成pipfile和pipfile.lock
- 自动在项目目录的.venv目录创建虚拟环境. 
- 自动管理pipfile新安装和删除的包
- 自动更新pip

使用pipenv代替pip安装包


## 4. pipenv 和autoenv的组合

autoenv可以在切换文件目录的同时, 自动完成激活虚拟环境
**用法**
    ```
    sudo pip install autoenv
    source /usr/local/bin/activate.sh

    mkdir test
    cd test
    touch .env
    echo 'source /home/xx/venv/bin/activate' > .env
    cd
    cd test  # 就会自动激活虚拟环境
    ```

## 5. conda

    1. 安装
    ```
    # miniconda
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh

    # conda
    wget https://repo.continuum.io/miniconda/Anaconda-latest-Linux-x86_64.sh
    bash Anaconda-latest-Linux-x86_64.sh
    ```


## 学习Emacs

- 安装

- 两种模式
 - GUI模式
 ```
 emacs  # 默认启动GUI
 emacd -nw FILE  # 终端中启动
 ```
 - Daemon模式

- 学习lisp


## Pycharm安装和使用

## 使用IPython

## Web开发环境配置

