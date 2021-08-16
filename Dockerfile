# syntax=docker/dockerfile:1
FROM ruby:3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /outdoor_sy
COPY Gemfile /outdoor_sy/Gemfile
COPY Gemfile.lock /outdoor_sy/Gemfile.lock
RUN bundle install

RUN rails webpacker:install

ADD . .

# Add a script to be executed every time the container starts.

EXPOSE 3000

CMD ["puma"]
