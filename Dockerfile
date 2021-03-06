FROM ruby:2.6-alpine
WORKDIR /app
RUN apk add --no-cache build-base tzdata nodejs
RUN gem install bundler
COPY Gemfile* /app/
RUN bundle install
COPY . /app/
ENTRYPOINT [ "smashing" ]
CMD [ "start" ]
