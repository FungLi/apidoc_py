# -*- coding: utf-8 -*-

import configparser
import os

class ConfigService:
    '''
    配置文件服务类
    '''
    def __init__(self):
        conf = configparser.ConfigParser()
        conf.read("env.conf")
        self.__set_project_path(conf.get('path', 'project_path'))

    # 设置project_path属性
    def __set_project_path(self, project_path):
        if project_path == '' or project_path is None:
            project_path = os.getenv('PROJECT_PATH')
        self.project_path = project_path
        