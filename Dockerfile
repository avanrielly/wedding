FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile ./
COPY Gemfile.lock ./
RUN gem install bundler && bundle install
EXPOSE 3000
COPY . ./
ENTRYPOINT ["bundle", "exec"]
