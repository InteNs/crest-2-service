FROM ruby:2.6-alpine3.8

ENV APP_ROOT /app

RUN apk add --no-cache --update build-base \
                                linux-headers \
                                postgresql-dev \
                                tzdata \
                                git

WORKDIR $APP_ROOT

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem install bundler

COPY ./Gemfile* $APP_ROOT/

RUN bundle install -j 5

COPY . $APP_ROOT/

CMD ["rails", "s"]
