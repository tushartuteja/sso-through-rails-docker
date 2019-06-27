FROM ruby:2.4.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY ./client2/Gemfile /myapp/Gemfile
COPY ./client2/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
CMD ["./devstart.sh"]