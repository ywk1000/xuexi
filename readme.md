# 说明 本仓库源于Techxuexi仓库 地址:https://github.com/TechXueXi/TechXueXi 略作本地修改,主要是自用,感谢techxuexi的各位开发者!
# fork自 https://github.com/ywk1000/xuexi 继续维护，主要是搜集了issue内大家所提出的修复方法
# 本项目为docker版后续修正，适用于有公网ip的云服务器或者会内网穿透的小伙伴使用，如果选用其他方式请自行参照 https://github.com/TechXueXi/TechXueXi 学习研究
# docker与docker-compose安装过程参考 https://github.com/TechXueXi/TechXueXi/wiki/Docker%E8%BF%90%E8%A1%8C
# 首先进入linux系统
cd /opt
# 下载本仓库文件 用于替换
git clone https://github.com/Yuulong/xuexi.git
# 进入xuexi目录
cd xuexi
# docker-compose 默认映射到/opt/xuexi 如果你的cpu架构不是x86 或者定时之类的修改,都可以详细去看看docker-compose.yaml文件, 里面都是照搬techxuexi的代码, 可以参照techxuexi的模板修改
docker-compose up -d
# 进入xuexi容器内
docker exec -it xuexi bash
# 进入 user 目录
cd user
# 修复诸多问题
sh fix.sh
# 退出容器
exit
# 容器外查看运行记录
docker logs -f xuexi
# 停止查看历史
# 按下 ctrl + c 按键即可停止

## 直接在浏览器打开 服务器ip:30080 即可查看网页 如果打不开,那么就是你的防火墙端口没开,请检查你的防火墙
## 如果需要修改端口,可以在docker-compose.yaml 文件 第18行 30080:80 这里就是将容器内80端口映射到服务器宿主机30080端口,容器内端口都在techxuexi内部代码,这里简单修改宿主机端口即可

## 更新一个 github 搭建的跳板，速度只能算可用，也算个更新吧
因为原作者不更新了。网站跳板不确定其稳定性，docker-compose.yaml原为
- -Scheme=https://ywk1000.github.io/xuexi/scheme.html?url=
- 如果出现无法登录请，在docker-compose.yaml最后一行替换为
- -Scheme = https://techxuexi.js.org/jump/techxuexi-20211023.html?