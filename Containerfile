FROM ruby:3.0
RUN gem install bundler

WORKDIR /srv/jekyll/

VOLUME [ '/srv/jekyll' ]
VOLUME [ '/usr/local/bundle' ]
EXPOSE 4000

ENTRYPOINT [ './launch.sh' ]
