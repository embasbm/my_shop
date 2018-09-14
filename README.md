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

To try different cases: please, use `rails console`

## Reference
embasbm@gmail.com

## TODOs

## REVIEW


  hese are some points the reviewers have sent to me out of the reviews:

  - Code style is not good: the `retrieve_product_for()` is very long a very complex.
  - Doesn't follow S.O.L.I.D principles: The Checkout class is the only one with code, the responsibilities of the code aren't well separated between Product and PricingRule.
  - Test support is very limited.
  ~~- Rails application is not needed~~
