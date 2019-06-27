#! /bin/sh
rm /myapp/tmp/pids/server.pid
echo 'bundle install'
bundle install
rails server