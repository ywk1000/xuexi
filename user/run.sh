#!/bin/bash

#随机数,表示随机一个59以内的数
randNum=$(($RANDOM%59))

echo "删除缓存文件"
cd /xuexi/user
rm user_status.json web_listener.log article_video_index.json daily.log

#随机延迟多少分钟
sleep randNum*60

echo "开始运行"
/usr/local/bin/python /xuexi/pandalearning.py
