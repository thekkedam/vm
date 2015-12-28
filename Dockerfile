FROM ubuntu:trusty
MAINTAINER Vipin Madhavanunni <vipintm@gmail.com>

ENV RUBY_VERSION 2.1

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 && \
    echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox-ruby-ng-trusty.list

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y \
        ca-certificates \
        openssl \
        libssl-dev \
        g++ \
        gcc \
        libc6-dev \
        make \
        patch \
        ruby$RUBY_VERSION \
        ruby$RUBY_VERSION-dev \
	build-essential \
	nodejs 

RUN rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log

RUN gem install bundler

WORKDIR /tmp 
COPY deploy/Gemfile Gemfile
COPY deploy/Gemfile.lock Gemfile.lock
COPY deploy/jekyll-serve jekyll-serve
COPY deploy/versions.json versions.json
RUN bundle install 

RUN mkdir -p /src
VOLUME ["/src"]
WORKDIR /src
ADD . /src

EXPOSE 4000

CMD ["./jekyll-serve"]
