# -*- coding: utf-8 -*-

import os

class BuildService:
    '''
    api doc 构建服务类
    '''
    def build(self, base_path, project_name, extend_path = ''):
        
        if extend_path is None:
            extend_path = ''
      
        if base_path == '' or base_path is None:
            return ' base_path is not allow empty'

        if project_name == '' or project_name is None:
            return ' project_name is not allow empty'

        file_path = os.path.join(base_path, extend_path, project_name)
        if os.path.exists(file_path) is False:
            return ' file is not exists：' + file_path

        cmd = 'apidoc -i '+ file_path +' -o ./static/apidocs/'+ project_name
        return os.popen(cmd).read()    
