# abook-api

Ruby Grape API. From scratch,...

This is code for my livecoding session for 2016-05-19.

- [Oto Brglez](https://github.com/otobrglez)

## Development

```bash
gem install bundler ; bundle
rake db:create && rake db:migrate

RACK_ENV=test rake db:create
RACK_ENV=test rake db:migrate
guard # or rspec
```

Running it:

```bash
rackup # or just "puma"
```

## Resources

- http://www.ruby-grape.org/
- https://github.com/delbetu/todo-app
- https://github.com/Maxim-Filimonov/hashie-forbidden_attributes
- https://github.com/ruby-grape/grape

## License
```MIT```

