FROM rubylang/ruby:3.0.0-focal
# FROM rubylang/ruby:3.0.0-rc1-focal
# FROM rubylang/ruby:3.0.0-preview2-focal

RUN mkdir /app
WORKDIR /app

COPY engines engines
COPY gems gems
COPY Gemfile Gemfile.lock ./

RUN bundle config set --local path 'vendor/bundle'
RUN bundle install -j9 --retry 3
ADD . /app

CMD ["tail", "-f"]
