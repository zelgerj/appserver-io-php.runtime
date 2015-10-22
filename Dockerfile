# base image
FROM debian

# update packages
RUN apt-get update && apt-get install -my
# install packages for development build environment
RUN	apt-get install wget curl htop telnet vim build-essential ant git php5 php5-curl -my
# install oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# install composer
RUN cd /usr/local/bin && php -r "readfile('https://getcomposer.org/installer');" | php && ln -s composer.phar composer

# mount runtime source
ADD . /runtime

# build runtime
RUN cd /runtime && ant build-runtime

# define mountable directories.
VOLUME ["/runtime", "/workspace"]

# define working directory.
WORKDIR /workspace

# default command
CMD ["zsh"]

# expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 9080
EXPOSE 9443