## 打开网页  https://registry.npmmirror.com/binary.html?path=chromium-browser-snapshots/   查找对应内核的chrome 浏览器
## 我这里以 chrome 64位  linux为例
## 对于谷歌Chrome32位版本，使用如下链接：
## wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
## 对于64位版本可以使用如下链接下载：
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
## 下载完后，运行如下命令安装。
sudo dpkg -i google-chrome*; sudo apt-get -f install
## 查看chrome 核心版本
google-chrome --version
## 比如我的版本是 Google Chrome 104.0.5112.79
## 假如 你的版本不是这个, 接下来咱们再说
## 打开网页 https://registry.npmmirror.com/binary.html?path=chromedriver/ 查找对应版本chromedriver
cd /tmp
wget https://registry.npmmirror.com/-/binary/chromedriver/104.0.5112.79/chromedriver_linux64.zip
## 解压缩 chromedriver 文件 到指定目录
unzip chromedriver_linux64.zip /usr/bin
## 检查 /etc/profile 文件中是否有path 指向 /usr/bin  这个目录 如果没有,请手动添加 export PATH=$PATH:/usr/local/bin/ChromeDriver 然后输入 source /etc/profile 同步变量
chromedriver   
## 查看输出文件 Starting ChromeDriver 104.0.5112.79 与chrome 版本相同即可, 如果版本无法一一对应,请按照chromedriver 的版本略小于chrome版本来算,千万不要driver版本号大于chrome, 否则无法使用  提示ChromeDriver was started successfully 即可
