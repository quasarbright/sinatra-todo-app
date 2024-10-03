# TODOS

a little todo app in sinatra. made this while learning sinatra

## local setup

```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
```

to see available rake commands, run

```
bundle exec rake -T
```

to run the application,

```
bundle exec rake generate_secret
SESSION_SECRET=<the output of the previous command> ruby myapp.rb
```