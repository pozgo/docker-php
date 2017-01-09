# PHP in a Docker
[![CircleCI Build Status](https://img.shields.io/circleci/project/pozgo/docker-php.svg)](https://circleci.com/gh/pozgo/docker-php/tree/latest)
[![GitHub Open Issues](https://img.shields.io/github/issues/pozgo/docker-php.svg)](https://github.com/pozgo/docker-php/issues)
[![GitHub Stars](https://img.shields.io/github/stars/pozgo/docker-php.svg)](https://github.com/pozgo/docker-php)
[![GitHub Forks](https://img.shields.io/github/forks/pozgo/docker-php.svg)](https://github.com/pozgo/docker-php)
[![Stars on Docker Hub](https://img.shields.io/docker/stars/polinux/php.svg)](https://hub.docker.com/r/polinux/php)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/polinux/php.svg)](https://hub.docker.com/r/polinux/php)
[![](https://images.microbadger.com/badges/version/polinux/php.svg)](http://microbadger.com/images/polinux/php)
[![](https://images.microbadger.com/badges/license/polinux/php.svg)](http://microbadger.com/images/polinux/php)
[![](https://images.microbadger.com/badges/image/polinux/php.svg)](http://microbadger.com/images/polinux/php)

This is PHP [polinux/php](https://registry.hub.docker.com/u/polinux/php/) Docker image.

For different PHP versions, look up different branches of this repository.
On Docker Hub you can find them under different tags:

* `polinux/php:latest` - PHP 7.1 built from master branch [![Circle CI](https://circleci.com/gh/pozgo/docker-php.svg?style=svg)](https://circleci.com/gh/pozgo/docker-php)
* `polinux/php:5.4` - PHP 5.4 built from 5.4 branch [![Circle CI](https://circleci.com/gh/pozgo/docker-php/tree/5.4.svg?style=svg)](https://circleci.com/gh/pozgo/docker-php)
* `polinux/php:5.5` - PHP 5.5 built from 5.5 branch [![Circle CI](https://circleci.com/gh/pozgo/docker-php/tree/5.5.svg?style=svg)](https://circleci.com/gh/pozgo/docker-php)
* `polinux/php:5.6` - PHP 5.6 built from 5.6 branch [![Circle CI](https://circleci.com/gh/pozgo/docker-php/tree/5.6.svg?style=svg)](https://circleci.com/gh/pozgo/docker-php)
* `polinux/php:7.0` - PHP 7.0 built from 7.0 branch [![Circle CI](https://circleci.com/gh/pozgo/docker-php/tree/7.0.svg?style=svg)](https://circleci.com/gh/pozgo/docker-php)
* `polinux/php:7.1` - PHP 7.1 built from 7.1 branch [![Circle CI](https://circleci.com/gh/pozgo/docker-php/tree/7.1.svg?style=svg)](https://circleci.com/gh/pozgo/docker-php)

#### Common dev tools for web app development

* Ruby 2.0, Bundler
* NodeJS and NPM
* NPM packages like gulp, grunt, bower, browser-sync

## Usage

`docker pull polinux/php`

Or, if you prefer to build it on your own:
`docker build -t polinux/php .`

Run the image:
`docker run polinux/php command`

Run the image as daemon and specify PHP version 5.6:
`docker run polinux/php:5.6 command`

## Author
Przemyslaw Ozgo (<linux@ozgo.info>)

---
This work is also inspired by [million12](https://github.com/million12/docker-nginx-php)'s work on [million12/nginx-php](https://hub.docker.com/r/million12/nginx-php/) docker image. Many thanks!
