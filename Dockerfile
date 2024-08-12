FROM ruby:3.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
ENV RACK_ENV production

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["./main.rb"]

EXPOSE 4567

