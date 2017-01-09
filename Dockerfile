FROM centos:7
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

COPY container-files/config/install* /config/

RUN \
  rpm --rebuilddb && \
  yum install -y epel-release && yum update -y && \
  `# Install yum-utils (provides yum-config-manager) + some basic web-related tools...` \
  yum install -y yum-utils wget patch mysql tar bzip2 unzip openssh-clients rsync make && \

  `# Install PHP 7.1 from Remi YUM repository...` \
  rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
  yum install -y \
    php71-php \
    php71-php-bcmath \
    php71-php-cli \
    php71-php-common \
    php71-php-devel \
    php71-php-fpm \
    php71-php-gd \
    php71-php-gmp \
    php71-php-intl \
    php71-php-json \
    php71-php-mbstring \
    php71-php-mcrypt \
    php71-php-mysqlnd \
    php71-php-opcache \
    php71-php-pdo \
    php71-php-pear \
    php71-php-process \
    php71-php-pspell \
    php71-php-xml \

    `# Also install the following PECL packages:` \
    php71-php-pecl-imagick \
    php71-php-pecl-mysql \
    php71-php-pecl-uploadprogress \
    php71-php-pecl-uuid \
    php71-php-pecl-zip \

    `# Temporary workaround: one dependant package fails to install when building image (and the yum error is: Error unpacking rpm package httpd-2.4.6-40.el7.centos.x86_64)...` \
    || true && \

  `# Set PATH so it includes newest PHP and its aliases...` \
  ln -sfF /opt/remi/php71/enable /etc/profile.d/php71-paths.sh && \
  `# The above will set PATH when container starts... but not when php is used on container build time.` \
  `# Therefore create symlinks in /usr/local/bin for all PHP tools...` \
  ln -sfF /opt/remi/php71/root/usr/bin/{pear,pecl,phar,php,php-cgi,php-config,phpize} /usr/local/bin/. && \

  php --version && \

  `# Move PHP config files from /etc/opt/remi/php71/* to /etc/* ` \
  mv -f /etc/opt/remi/php71/php.ini /etc/php.ini && ln -s /etc/php.ini /etc/opt/remi/php71/php.ini && \
  rm -rf /etc/php.d && mv /etc/opt/remi/php71/php.d /etc/. && ln -s /etc/php.d /etc/opt/remi/php71/php.d && \

  echo 'PHP 7 installed.' && \

  `# Install libs required to build some gem/npm packages (e.g. PhantomJS requires zlib-devel, libpng-devel)` \
  yum install -y ImageMagick GraphicsMagick gcc gcc-c++ libffi-devel libpng-devel zlib-devel && \

  `# Install common tools needed/useful during Web App development` \
  `# Install Ruby 2` \
  yum install -y ruby ruby-devel && \
  echo 'gem: --no-document' > /etc/gemrc && \
  gem update --system && \
  gem install bundler && \

  `# Install/compile other software (Git, NodeJS)` \
  source /config/install.sh && \

  `# Install common npm packages: grunt, gulp, bower, browser-sync` \
  npm install -g gulp grunt-cli bower browser-sync && \

  `# Disable SSH strict host key checking: needed to access git via SSH in non-interactive mode` \
  echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \

  `# Install Memcached, Redis PECL extensions from the source. Versions available in yum repo have dependency on igbinary which causes PHP seg faults in some PHP apps (e.g. Flow/Neos)...` \
  `# Install PHP Memcached ext from the source...` \
  yum install -y libmemcached-devel && \
  git clone https://github.com/php-memcached-dev/php-memcached.git && cd php-memcached && git checkout php7 && \
  phpize && ./configure && make && make install && \
  echo "extension=memcached.so" > /etc/php.d/50-memcached.ini && \
  `# Install PHP Redis ext from the source...` \
  git clone https://github.com/phpredis/phpredis.git && cd phpredis && git checkout php7 && \
  phpize && ./configure && make && make install && \
  echo "extension=redis.so" > /etc/php.d/50-redis.ini && \

  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \

  `# Clean YUM caches to minimise Docker image size... #` \
  yum clean all && rm -rf /tmp/yum*
