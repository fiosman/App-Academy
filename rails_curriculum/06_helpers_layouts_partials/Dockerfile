FROM ruby:2.5.5-alpine3.9
# This is a file we use for building a Docker image for this project in production.
# No need to worry about this file for now!
RUN apk add --no-cache --update build-base \
    linux-headers \
    git \
    postgresql-dev \
    nodejs \
    tzdata

# environment vars must be included in the dockerfile
ENV DATABASE_URL="postgres://postgres@db"
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

# copy over our Gemfile
WORKDIR /my_app
COPY Gemfile /my_app/Gemfile
COPY Gemfile.lock /my_app/Gemfile.lock

# We gem install bundler for a specific issue with bundler 2.0
# then we can bundle install
RUN gem install bundler && bundle install
COPY . /my_app
RUN SECRET_KEY_BASE=1 RAILS_ENV=production bin/rails assets:precompile

# Add a script to be executed every time the container starts.
# This script will take care of a Rails specific Docker issue with the server
# not starting
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh 

# Expose our port
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]