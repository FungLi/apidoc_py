apidoc_py
=====
#### 使用flask扩展开发apidoc，支持api文档的在线浏览、远程构建和自动构建等功能

依赖环境
--------
```
Python > 3.x.x  
    flask   
nodejs > 8.x.x  
    apidoc
```

docker部署
------

#### 1. 项目目录结构：
```
├── config
│   ├── contrab
│   │   └── crontabfile
│   ├── docker-entrypoint.sh
│   ├── nginx
│   │   └── conf.d
│   │       └── apidoc_py.conf
│   └── uwsgi
│       └── conf.d
│           └── uwsgi.ini
├── docker-compose.yml
├── Dockerfile
├── Dockerfile.dev
├── logs
│   └── uwsgi.log
├── README.md
└── src
    ├── app.py
    ├── build.py
    ├── env.conf
    ├── services
    │   ├── BuildService.py
    │   ├── ConfigService.py
    │   ├── IndexService.py
    │   └── __init__.py
    ├── static
    │   ├── css
    │   │   └── index.css
    │   └── js
    │       ├── index.js
    │       └── lib
    │           └── jquery-1.9.1.min.js
    └── templates
        └── index.html
```

#### 2. uwsgi服务配置文件目录：config/uwsgi/conf.d
配置项目目录chdir，和日志目录logto

#### 3. 定时任务计划文件配置目录：config/crontab/
配置计划任务

#### 4. Dockerfile文件中配置环境变量
PROJECT_PATH：项目源码路径
WEB_DIR：站点目录