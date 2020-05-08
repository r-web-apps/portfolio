FROM ruby:2.7.1

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

RUN mkdir /usr/src/app
ADD . /usr/src/app/

ENV RAILS_ENV=production
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get remove cmdtest && apt-get update -qq && apt-get install -y yarn && apt-get clean
RUN chmod +x /usr/src/app/bin/rails
WORKDIR /usr/src/app/
RUN bundle install
RUN yarn install --ignore-scripts && yarn install
RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD rails db:migrate && rails s -b 0.0.0.0
