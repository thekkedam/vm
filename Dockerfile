FROM debian:jessie
MAINTAINER Vipin Madhavanunni <vipintm@gmail.com>

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install ruby ruby-doc ruby-dev nodejs

RUN gem install bundler jekyll nokogiri 

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
