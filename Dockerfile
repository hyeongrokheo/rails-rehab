FROM ruby:2.7.6

RUN apt update -qq

WORKDIR /app

COPY . .

RUN gem install bundler && bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
