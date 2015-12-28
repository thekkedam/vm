FROM alpine:latest
MAINTAINER Vipin Madhavanunni <vipintm@gmail.com>

# Install all the dependencies for Jekyll
RUN apk add --update bash build-base libffi-dev zlib-dev libxml2-dev \
			libxslt-dev ruby ruby-dev nodejs

# Install bundler
RUN gem install bundler 

# Copy the Gemfile and Gemfile.lock into the image and run bundle install in a
# way that will be cached
WORKDIR /tmp 
COPY deploy/Gemfile Gemfile
COPY deploy/Gemfile.lock Gemfile.lock
COPY deploy/jekyll-serve jekyll-serve
COPY deploy/versions.json versions.json

# lets install all required gems
RUN bundle config build.nokogiri --use-system-libraries 
RUN bundle config build.jekyll --no-rdoc
RUN bundle install 

# Copy source
RUN mkdir -p /src
VOLUME ["/src"]
WORKDIR /src
ADD . /src

# Jekyll runs on port 4000 by default
EXPOSE 4000

# Run jekyll serve
CMD ["./jekyll-serve"]
