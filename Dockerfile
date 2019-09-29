FROM ruby:2.6.3

RUN apt-get update -qq

COPY .ruby-version Gemfile Gemfile.lock /

RUN gem update --system
RUN gem install bundler -v $(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -1 | tr -d " ")
RUN bundle install --frozen --jobs=4 --retry=3 --full-index && bundle clean

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY action.rb /action.rb

ENTRYPOINT ["/entrypoint.sh"]
