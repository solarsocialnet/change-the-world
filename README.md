# Change The World - Web app

This is the repository of the project Change The World.

## How to contribute
### Conventions
- Write semantic commit messages and use [Karma](http://karma-runner.github.io/2.0/dev/git-commit-msg.html) pattern.
- TODO: Define workflow (GitFlow?)

## Requirements
Install the following requirements prior to running this project:
1. [Docker](https://docs.docker.com/install/)
2. [Docker compose](https://docs.docker.com/compose/install/)

## How to get this project up and running
1. Go to the root of this project (where this readme file is located)
2. Run the following commands on your terminal:
    - Build docker image: `docker build .`
    - Run migrations: `docker-compose run web python /app/change/manage.py migrate --noinput`
    - Start app server: `docker-compose up -d --build`
3. You should be able to access the admin endpoint: http://127.0.0.1:8000/admin
