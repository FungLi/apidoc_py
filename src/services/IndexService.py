# -*- coding: utf-8 -*-

import os

class IndexService:
    '''
    首页服务类
    '''
    IGNORE_DIR_AND_FILE = ['.idea','.vscode','vendor','framework','sdk', 'apidoc_py'] 

    def get_path_dirs(self, path):
        ''' Return dir name list
        获取指定目录下的文件夹名称
        '''
        _listdir = []
        # 目是否存在
        if os.path.exists(path):
            _listdir = os.listdir(path)

        # 过滤掉文件和忽略的目录
        for _dir in _listdir:
            if os.path.isfile(_dir):
                _listdir.remove(_dir)
            if _dir in self.IGNORE_DIR_AND_FILE:
                _listdir.remove(_dir)
        return _listdir
