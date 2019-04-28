FROM ruby:2.6.0

LABEL "com.github.actions.name"="Default PR Project Board"
LABEL "com.github.actions.description"="Adds new Pull Requests to Project Board"
LABEL "com.github.actions.icon"="grid"
LABEL "com.github.actions.color"="gray-dark"

RUN apt-get update -qq
RUN gem install bundler:2

COPY Gemfile Gemfile.lock /
RUN bundle install --jobs=4 --retry=3 --full-index

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY action.rb /action.rb

ENTRYPOINT ["/entrypoint.sh"]
