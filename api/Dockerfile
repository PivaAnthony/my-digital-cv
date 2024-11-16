FROM ruby:3.3.6

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
