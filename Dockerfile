FROM ruby:3.3.0

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    libqt5webkit5-dev \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

WORKDIR /rails-varnish

ENV BUNDLE_PATH /gems

COPY Gemfile* .
RUN bundle install

COPY . ./

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]