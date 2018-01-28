# -*- coding: utf-8 -*-
'''
apidoc python
   ps：集成apidoc，支持 http request build、crontab build、browse
'''

from flask import Flask,render_template,request
from services.IndexService import IndexService
from services.BuildService import BuildService
from services.ConfigService import ConfigService
APP = Flask(__name__)

@APP.route("/")
@APP.route("/apidoc/")
@APP.route("/index/")
def index():
    '''
    显示文档内容
    1、获取指定目录下
    2、左侧显示文件夹结构、右侧直接显示apidoc内容
    '''
    _listdir = IndexService().get_path_dirs('./static/apidocs')
    return render_template('/index.html', listdir=_listdir)

@APP.route("/build")
def build():
    '''
    构建api doc
    '''
    project_name = request.args.get('project_name')

    extend_path = request.args.get('extend_path')

    exec_content = BuildService().build(ConfigService().project_path, project_name, extend_path)
    return exec_content

if __name__ == '__main__':
    APP.debug = True
    APP.run()