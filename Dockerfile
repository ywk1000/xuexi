
FROM python:3.7-slim
ARG usesource="git clone -b source https://github.com/ywk1000/xuexi.git"
ARG usebranche="dev"
ENV pullbranche=${usebranche}
ENV Sourcepath=${usesource}
RUN apt-get update
RUN apt-get install -y wget unzip libzbar0 git cron supervisor
ENV TZ=Asia/Shanghai
ENV AccessToken=
ENV Secret=
ENV Nohead=True
ENV Pushmode=1
ENV islooplogin=False
ENV CRONTIME="18 8,20 * * *"
# RUN rm -f /xuexi/config/*; ls -la
COPY requirements.txt /xuexi/requirements.txt
COPY run.sh /xuexi/run.sh 
COPY start.sh /xuexi/start.sh 
COPY supervisor.sh /xuexi/supervisor.sh

RUN pip install -r /xuexi/requirements.txt
RUN cd /xuexi/; \
  wget http://one2019.herokuapp.com/%E5%B7%A5%E5%85%B7%E8%BD%AF%E4%BB%B6/google-chrome-stable_103.0.5060.134-1_amd64.deb; \
  dpkg -i google-chrome-stable_103.0.5060.134-1_amd64.deb; \
  apt-get -fy install; \
  google-chrome --version; \
  rm -f google-chrome-stable_103.0.5060.134-1_amd64.deb
RUN cd /xuexi/; \
  wget -O chromedriver_linux64_103.0.5060.134.zip http://one2019.herokuapp.com/%E5%B7%A5%E5%85%B7%E8%BD%AF%E4%BB%B6/chromedriver_linux64.zip; \
  unzip chromedriver_linux64_103.0.5060.134.zip; \
  chmod 755 chromedriver; \
  ls -la; \
  ./chromedriver --version
RUN apt-get clean
WORKDIR /xuexi
RUN chmod +x ./run.sh
RUN chmod +x ./start.sh
RUN chmod +x ./supervisor.sh;./supervisor.sh
#RUN mkdir code
#WORKDIR /xuexi/code
#RUN git clone -b ${usebranche} ${usesource}; cp -r /xuexi/code/TechXueXi/SourcePackages/* /xuexi;
WORKDIR /xuexi
EXPOSE 80
ENTRYPOINT ["/bin/bash", "./start.sh"]
