# 说明
# 首先进入linux系统
cd /opt
# 下载本仓库文件 用于替换
git clone https://github.com/ywk1000/xuexi.git
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

## 直接在浏览器打开 服务器ip:30080 即可查看网页 如果打不开,那么就是你的防火墙端口没开,请检查你的防火墙
## 如果需要修改端口,可以在docker-compose.yml 文件 第18行 30080:80 这里就是将容器内80端口映射到服务器宿主机30080端口,容器内端口都在techxuexi内部代码,这里简单修改宿主机端口即可
