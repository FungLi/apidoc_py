#!/bin/bash

project_name=$1

if [ ! $project_name ]; then
 echo "请输入仓库名称"
 exit
fi

curl -l "http://apidoc.myyscrm.com.cn/apidoc/build?project_name=$project_name"