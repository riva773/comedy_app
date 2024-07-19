ARG RUBY_VERSION=ruby:3.3.0
ARG NODE_VERSION=20
FROM $RUBY_VERSION
ARG RUBY_VERSION
ARG NODE_VERSION
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential nodejs yarn
RUN mkdir /comedy_app
WORKDIR /comedy_app
RUN gem install bundler
COPY Gemfile /comedy_app/Gemfile
COPY Gemfile.lock /comedy_app/Gemfile.lock
COPY yarn.lock /comedy_app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /comedy_app

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
