#!/bin/bash
mkdir -p temp
# 寻找 windows 目录下面的 *.cur 文件,然后给他用 icotool 解压,放到 temp 目录
find ./windows -name "*.cur" | xargs -i icotool -x {} -o ./temp/

# 寻找 windows 目录下面的 *.ani 文件,然后给他用 ani2ico 转换成 *.ico 文件
find ./windows -name "*.ani" | xargs -i ani2ico {}
mv ./windows/*.ico ./temp/ 

# 删除 temp 目录下面的 *.ico 文件
rm -rf ./temp# 将所有的 ico 转换为 png 文件
# 用 for 循环
for i in ./temp/*.ico; do
    # 拿下文件名,丢掉后缀
    name=${i%.*}
    # echo $name
    convert $i $name.png
done