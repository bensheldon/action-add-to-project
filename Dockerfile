FROM ruby:2.6.3

LABEL "com.github.actions.name"="Add to Project Board"
LABEL "com.github.actions.description"="Adds new Issues and Pull Requests to a Project Board"
LABEL "com.github.actions.icon"="align-justify"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.repository"="https://github.com/bensheldon/action-add-to-project"
LABEL "com.github.actions.maintainer"="Ben Sheldon <bensheldon@gmail.com>"

RUN apt-get update -qq

RUN gem update --system
RUN gem install bundler -v "~>2.0"

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY action.rb /action.rb

ENTRYPOINT ["/entrypoint.sh"]
