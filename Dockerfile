FROM ruby:3.0
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=1
EXPOSE 3000:3000
RUN mkdir app
WORKDIR app
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
ADD . .
CMD [ "rails", "server" ]
