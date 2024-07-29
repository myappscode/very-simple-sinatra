FROM ruby:3.3.4-alpine3.20
ARG VERSION=unknown
RUN bundle config --global frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN echo $VERSION > version.txt
RUN --mount=type=secret,id=mysecret \
  echo $(cat /run/secrets/mysecret) > secret.txt
COPY . .
CMD ["ruby", "server.rb"]
