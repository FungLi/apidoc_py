#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from services.BuildService import BuildService
from services.ConfigService import ConfigService
from services.IndexService import IndexService

configService = ConfigService()
buildService = BuildService()

# 是否指定项目名称
project_name = None
if len(sys.argv) > 1:
    project_name = sys.argv[1]

if project_name:
    print(buildService.build(configService.project_path, project_name))
else:
    project_names = IndexService().get_path_dirs('./static/apidocs')
    for project_name in project_names:
        print(buildService.build(configService.project_path, project_name))
