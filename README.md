## About

``` rails g new app [-d mysql] [-T]```

We will use mysql as DBMS, and will avoid test folder generic folder

```ruby
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
```

- model `Product(code, name, price:decimal)`
- model `PricingRule(product, count, price:decimal)`


## Concerns

Decided to use a rails Service, since it seem the best option because it does not apply on any MVC part.
Might be not that necessary to actually use a rails app, but it just makes it easy, encapsulating all the code including the rspec tests.

```rspec``` will test all the cases available on [here](https://github.com/cabify/rubyChallenge)

To try different cases: please, use `rails console

## Reference
embasbm@gmail.com
## TODOs
