# String Calculator

mkdir incubyte-string-calculator && cd $_
git init

## Create Gemfile

bundle init

## Add RSpec to the Gemfile (see file content below), then

bundle install

## Initialize RSpec (generates .rspec and spec/spec_helper.rb)

bundle exec rspec --init

## Create library folder and the skeleton class

mkdir -p lib
touch lib/string_calculator.rb
