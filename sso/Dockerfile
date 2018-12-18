FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY ./sso/Gemfile /myapp/Gemfile
COPY ./sso/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
CMD ["rails", "server"]