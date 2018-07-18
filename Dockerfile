FROM ubuntu:xenial

# RUN echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update -qq && apt-get install -y -qq curl supervisor git wget

# install npm
RUN apt-get update -qq && apt-get install -y -qq npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# install robohydra
RUN npm install --global robohydra

VOLUME /var/www
WORKDIR /var/www/current

EXPOSE 3000

CMD ["/usr/local/bin/robohydra", "/var/www/current/robohydra.conf"]
