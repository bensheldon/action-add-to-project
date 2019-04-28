FROM ruby:2.6.0

LABEL "com.github.actions.name"="Add to Project Board"
LABEL "com.github.actions.description"="Adds Issues and Pull Requests to a Project Board"
LABEL "com.github.actions.icon"="columns"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.repository"="https://github.com/bensheldon/action-add-to-project"
LABEL "com.github.actions.maintainer"="Ben Sheldon <bensheldon@gmail.com>"

RUN apt-get update -qq
RUN gem install bundler:2

COPY Gemfile Gemfile.lock /
RUN bundle install --jobs=4 --retry=3 --full-index

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY action.rb /action.rb

ENTRYPOINT ["/entrypoint.sh"]
