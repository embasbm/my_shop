require 'rspec'
require 'pry'

def create_products
  @voucher = Product.new('VOUCHER', 'Cabify Voucher', 5.00)
  @tshirt  = Product.new('TSHIRT', 'Cabify T-Shirt', 20.00)
  @mug     = Product.new('MUG', 'Cafify Coffee Mug', 7.50)
end

create_products


def create_products_and_offers
  @marketing_offer = PricingRule.new(2, @voucher.price, @voucher)
  fco_offer       = PricingRule.new(3, 19.00, true, @tshirt)
end
