require 'product'
require 'pricing_rule'
class Checkout
  attr_reader :products, :pricing_rules
  def initialize(pricing_rules)
    @products = []
    @pricing_rules = pricing_rules
    @total = 0.0
  end

  def scan(product_name)
    @products << product_name.downcase
  end

  def total
    @pricing_rules.each do |offer|
      retrive_product_for(offer)
    end
    @total += @products.collect {|x| get_price(x)}.sum
    @total.to_s
  end

  private
    def retrive_product_for(offer)
      similar_products = @products.select {|x| x == offer.product.code.downcase}
      if offer.bulk_purchase
        bulk_purchase(similar_products, offer)
      else
        offer_purchase(similar_products, offer)
      end
    end

    def get_price(code)
      case code.downcase
      when 'voucher'
        5.00
      when 'tshirt'
        20.00
      else
        7.50
      end
    end

    def bulk_purchase(similar_products, offer)
      return if similar_products.count < offer.count
      @products.delete(similar_products.first)
      @total += (offer.price * similar_products.count)
    end

    def offer_purchase(similar_products, offer)
      return if similar_products.count < offer.count
      coef = similar_products.count / offer.count
      rest = similar_products.count % offer.count
      @products.delete(similar_products.first)
      coef.times { @total += offer.price }
      rest.times { @products << similar_products.first }
    end
end
