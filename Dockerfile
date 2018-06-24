FROM ruby:2.5.1-alpine3.7

RUN apk update && apk upgrade && apk add --update --no-cache tzdata sqlite-dev nodejs && \
  rm -rf /usr/lib/mysqld* && rm -rf /usr/bin/mysql* && \
  apk add --update --no-cache mysql-client && \
  cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app

ARG BUNDLE_OPTIONS

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN apk add --no-cache --virtual .rails-builddeps alpine-sdk && \
  bundle install -j4 ${BUNDLE_OPTIONS} && \
  apk del .rails-builddeps

ADD . /app

EXPOSE  3000
