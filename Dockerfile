FROM ubuntu:16.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y gawk wget git-core diffstat nano file zstd liblz4-tool unzip texinfo gcc-multilib \
		build-essential chrpath socat cpio python3 python python3-pip python3-pexpect \
		xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
		xterm locales locales-all

# set proper locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# set bash as default shell
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN useradd -ms /bin/bash yocto
RUN echo "root:yocto" | chpasswd

RUN mkdir Yocto
RUN chown -R root:yocto /Yocto
RUN chmod 777 /Yocto
RUN chown -R root:yocto /home
RUN chmod 777 /home
RUN chown -R root:yocto /home/yocto
RUN chmod 777 /home/yocto


USER yocto

RUN  cd Yocto && git clone -b zeus https://git.yoctoproject.org/poky && cd poky && git clone https://github.com/analogdevicesinc/meta-adi.git && git clone -b zeus https://github.com/Xilinx/meta-xilinx.git && git clone -b zeus https://github.com/openembedded/meta-openembedded.git


