#!/bin/bash
#随机数,表示随机一个3600以内的数
#randNum=$(($RANDOM%3599))

echo "修复专项"
cp /xuexi/user/answer_question.py /xuexi/pdlearn/answer_question.py
sleep 3
echo "修改web显示"
cp /xuexi/user/index.html /xuexi/static/index.html
sleep 3
echo "修复score获取接口"
cp /xuexi/user/score.py /xuexi/pdlearn/score.py
sleep 3
echo "修复答题，绕过验证码机制"
cp /xuexi/user/mydriver.py /xuexi/pdlearn/mydriver.py
sleep 3
cp /xuexi/user/chromedriver /xuexi/chromedriver
chmod +775 /xuexi/chromedriver
sleep 10
echo "修改定时随机延迟"
cp /xuexi/user/run.sh /xuexi/run.sh
chmod +x /xuexi/run.sh
echo "修改完成"

exit
