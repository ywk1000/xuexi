docker-compose.yaml中的内容为:

version: "3.6"

services:
    xuexi:
        image: techxuexi/techxuexi-arm64v8:latest
        container_name: xuexi
        # 自动重启
        restart: always
        network_mode: bridge
        # 挂载目录
        volumes:
            - /opt/xuexi/user:/xuexi/user
            - /opt/xuexi/static:/xuexi/static
            - /opt/xuexi/pdlearn:/xuexi/pdlearn
        # 打开的端口
        ports:
            # 打开9980端口，访问 http://ip:9980 进行控制
            - 9980:80
            - 9981:8088
        # 设置共享内存2g（shared memory）,减少chrome崩溃
        shm_size: 2gb
        # 环境变量
        environment:
            # 将在每天0：25和18：25自动运行一次学习，防止忘记点UID开始学习
            - CRONTIME=25 0,18 * * *
            # 每6小时运行一次
            # - CRONTIME=25 */6 * * *
            # 打开专项答题
            - ZhuanXiang=True
            # 信息推送模式：网页模式
            - Pushmode=6
            # 以下爱参数网页模式不需要，其他模式请根据实际情况修改
            # - "AccessToken={token}"
            # - "Secret={密钥}"


如果进了容器还想修改 定时 可以
crontab -e 
然后修改时间即可
由于容器里面没有文本编辑器,需要使用apt install 命令来安装编辑器
比如:
apt install vim -y
就是安装vim 编辑器
