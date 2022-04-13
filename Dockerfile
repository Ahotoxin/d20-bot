FROM ruby
COPY . /bot
WORKDIR /bot
RUN bundle install
CMD ["ruby","app.rb"]  