FROM ruby

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
    apt-get install -y \
    apt-utils \
    nodejs \
    yarn
    
WORKDIR /code/
COPY Gemfile* /code/
RUN bundle install

EXPOSE 3000