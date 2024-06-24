FROM ruby:3.3.3

ENV APP_HOME=/home/app \
    RAILS_PORT=3000

RUN addgroup --system app --gid 1000 \
    && adduser -S -h $APP_HOME -G app app

WORKDIR $APP_HOME

COPY --chown=app:app Gemfile* ./

RUN bundle install

EXPOSE $RAILS_PORT

CMD bundle exec rake db:migrate && rm -f tmp/pids/server.pid && bundle exec rails s -p $RAILS_PORT -b '0.0.0.0'