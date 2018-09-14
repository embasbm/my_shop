class PricingRule
  attr_reader :count, :price, :bulk_purchase, :product
  def initialize(count, price, bulk_purchase = false , product)
    @count = count
    @price = price
    @bulk_purchase = bulk_purchase
    @product = product
  end
end
