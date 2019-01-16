FROM ruby:2.6.0

RUN apt-get update && apt-get install -y nodejs nodejs-legacy yarn

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
