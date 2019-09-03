# docker-compose_for_RMN
The Ruby on Rails environment by Ruby, MariaDB, and Nginx that is defined by docker-compose.

# Usage

## Build the new Rails Project.

this is build a docker-compose environment, and create a new Rails project on it.

1. `docker-compose build`
1. `docker-compose run app bundle init`
1. add or change to `gem 'rails'` on Gemfile
1. `docker-compose run app bundle install`
1. `docker-compose run app bundle exec rails new ../${APP_NAME} --database=mysql` (${APP_NAME} is you set on docker-compose.yml)
    - you need overrite README.md (this file), Gemfile (created by bundle init), and .gitignore (is included this repositiory), maybe.
1. edit `config/database.yml`, set the following;
    - set `<%= ENV.fetch('DB_PASSWORD') %>` to `password`
    - set `<%= ENV.fetch('DB_HOST') %>` to `host`
    - attention; THIS SETTING USE 'root' account of MariaDB
1. `docker-compose run app bundle exec rake db:create`
1. `docker-compose up`
1. access to `http://<docker-host>/` by the web browser.

Note:
if you use webpack, execute  the following 2 step, before `docker-compose up`.

1. `docker-compose run app yarn install`
1. `docker-compose run app bin/rake webpacker:install`

## Boot the already exist Rails project.

1. `docker-compose build`
1. `docker-compose run app bundle install`
1. `docker-compose run app bundle exec rake db:create`
1. `docker-compose up`
1. access to `http://<docker-host>/` by the web browser.
