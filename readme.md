# 说明
# 首先进入linux系统
cd /opt
# 下载一些文件
git clone https://ghproxy.com/https://github.com/ywk1000/xuexi.git
# 进入xuexi目录
cd xuexi
# docker-compose 默认映射到/opt/xuexi
docker-compose up -d
# 进入xuexi容器内
docker exec -it xuexi bash
# 进入 user 目录
cd user
# 修复专项答题及首页显示和随机延迟定时
sh fix_zhuanxiang.sh
# 退出容器
exit
# 容器外查看运行记录
docker logs -f xuexi
# 停止查看历史
# 按下 ctrl + c 按键即可停止
