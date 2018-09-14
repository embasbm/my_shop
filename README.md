## About

* model `Product`
* model `PricingRule`
* model `Checkout`

## How to

```ruby
  git clone https://github.com/embasbm/my_shop
  cd my_shop
  rspec
```

## Reference

embasbm@gmail.com

## TODOs

## REVIEW

  These are some points the reviewers have sent to me out of the reviews:

    * Code style is not good: the `retrieve_product_for()` is very long a very complex.

    * Doesn't follow S.O.L.I.D principles:

      ** The Checkout class is the only one with code, the responsibilities of the code aren't well separated between Product and PricingRule.

    * Test support is very limited.

    ~~* Rails application is not needed~~
