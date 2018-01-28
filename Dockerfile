
FROM docker.io/ubuntu

# 标注信息
LABEL author="fungli"
LABEL email="li_fighting@163.com"
LABEL version="1.0"
LABEL description="基于flask框架扩展apidoc，支持 http request build、crontab build、browse"

# 安装wget、安装gcc、g++依赖库、crontab
RUN apt-get update && \
    apt-get install -y wget cron && \
    apt-get install -y zlib1g-dev libbz2-dev libssl-dev libncurses5-dev libsqlite3-dev && \
    apt-get install -y libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev xz-utils libexpat-dev build-essential

# 编译安装python3
RUN wget https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tar.xz -P ~/ && \
    tar -xvf ~/Python-3.6.2.tar.xz && \
    cd Python-3.6.2 && \
    ./configure --prefix=/usr/local/python3 && \
    make && make install && \
    ln -sv /usr/local/python3/bin/python3 /usr/local/bin/ && \
    ln -sv /usr/local/python3/bin/pip3 /usr/local/bin/

# 安装flask和uwcgi
RUN pip3 install flask && \
    pip3 install uwsgi

# 安装nodejs 和 apidoc
RUN wget https://nodejs.org/dist/v8.1.0/node-v8.1.0-linux-x64.tar.xz -P ~/ && \
    tar -xvf ~/node-v8.1.0-linux-x64.tar.xz -C /usr/local && \
    mv /usr/local/node-v8.1.0-linux-x64 /usr/local/node-v8.1.0 && \
    ln -sv /usr/local/node-v8.1.0/bin/node /usr/local/bin/node && \
    ln -sv /usr/local/node-v8.1.0/bin/npm /usr/local/bin/npm && \
    npm install -g apidoc && \
    ln -sv /usr/local/node-v8.1.0/bin/apidoc /usr/local/bin/apidoc

# 设置python的环境变量
ENV PYENV_ROOT="/usr/local/python3"
ENV PATH="$PYENV_ROOT/bin:$PATH"
# 设置环境变量，apidoc识别的环境路径
ENV PROJECT_PATH="/var/www/html"
# apidoc_py应用目录
ENV WEB_DIR="/var/www/html/apidoc_py"
# 对外公开的端口
ENV PORT=5001

# 创建docker-entrypoint启动脚本
RUN echo "#!/bin/bash " > /usr/local/bin/docker-entrypoint && \
    echo "crontab ${WEB_DIR}/config/crontab/crontabfile " >> /usr/local/bin/docker-entrypoint && \
    echo "cron -f & " >> /usr/local/bin/docker-entrypoint && \
    echo "uwsgi --ini ${WEB_DIR}/config/uwsgi/conf.d/uwsgi.ini " >> /usr/local/bin/docker-entrypoint && \
    chmod +x /usr/local/bin/docker-entrypoint

EXPOSE ${PORT}

# VOLUME [ ${WEB_DIR} ]

# 设置容器运行后，执行的uwsgi服务启动脚本
# ENTRYPOINT [ "docker-entrypoint" ]

# 容器启动所需要运行的特定指令
CMD [ "docker-entrypoint", "params"]
