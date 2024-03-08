FROM ruby:2.7
RUN gem install bundler -v '= 2.3.7'

WORKDIR /srv/jekyll/

VOLUME [ '/srv/jekyll' ]
VOLUME [ '/usr/local/bundle' ]
EXPOSE 4000

ENTRYPOINT [ './launch.sh' ]
