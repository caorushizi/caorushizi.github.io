#!/usr/bin/env bash

# 登录七牛云帐号，使用 blogfile bucket
./qshell account "$1" "$2" blogfile

# 上传文件并输出上传成功列表
echo '==============================================='
echo '=                success.txt                  ='
echo '==============================================='
./qshell qupload2 --src-dir=./_site --bucket=zy-blogfile --check-exists --check-hash --thread-count=5 --overwrite --success-list=success.txt
cat success.txt


echo '==============================================='
echo '=                refresh.txt                  ='
echo '==============================================='
awk '{printf "https://blog.ziying.site/%s\n", $2, $2}' success.txt | sed -e "s/index.html//" > refresh.txt
cat refresh.txt

# 使用七牛云工具刷新CDN缓存
./qshell cdnrefresh -i refresh.txt

echo '==============================================='
echo '=              refresh.www.txt                ='
echo '==============================================='
awk '{printf "https://www.blog.ziying.site/%s\n", $2, $2}' success.txt | sed -e "s/index.html//" > refresh.www.txt
cat refresh.www.txt

# 使用七牛云工具刷新CDN缓存
./qshell cdnrefresh -i refresh.www.txt
