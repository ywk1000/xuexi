#!/bin/bash
#随机数,表示随机一个30以内的数
#randNum=$(($RANDOM%59))

#echo"修复专项"
cp /xuexi/user/answer_question.py /xuexi/pdlearn/answer_question.py
sleep 3
#echo"修改web显示"
cp /xuexi/user/index.html /xuexi/static/index.html
sleep 3
#echo"修改定时随机延迟"
cp /xuexi/user/run.sh /xuexi/run.sh
#echo"修改完成"
exit
