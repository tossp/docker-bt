FROM centos:7

LABEL authors="Mingfun Wong<mingfun.wong.chn@gmail.com>,TossPig <docker@TossP.com>"\
      maintainer="TossPig <docker@TossP.com>" \
      version="6.9.4" \
      description="宝塔面板"
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN yum install -y wget \
    && wget -O install.sh http://download.bt.cn/install/install_6.0.sh \
    && sed -i 's/read -p "Do you want to install Bt-Panel to the $setup_path directory now?(y\/n): " go;/go="y"/g' install.sh \
    && sed -i 's/password=`cat \/dev\/urandom | head -n 16 | md5sum | head -c 8`/password="ts610000"/g' install.sh \
    && bash install.sh

VOLUME ["/www/wwwroot","/www/backup","/www/wwwlogs","/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
