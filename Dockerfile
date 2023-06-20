FROM ruby:3.2.2-slim

RUN apt-get update && apt-get install -y --no-install-recommends build-essential libsqlite3-dev

WORKDIR /rails-varnish

ENV BUNDLE_PATH /gems

COPY Gemfile* .
RUN bundle install

COPY . ./

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]