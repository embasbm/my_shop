class CheckoutService
  attr_reader :products
  def initialize(pricing_rules)
    @products = Hash.new()
    @pricing_rules = pricing_rules
    @total = 0.0
  end

  def scan(product_name)
    product = Product.find_by(code: product_name)
    raise "Not recognized product with code #{product_name}" unless product
    @products[@products.count] = product
  end

  def total
    @pricing_rules.each do |offer|
      retrive_product_for(offer)
    end
    @total += @products.collect {|k,v| v.price}.sum
    @total.to_s
  end

  private
    def retrive_product_for(offer)
      xx = @products.select {|k,v| v.code == offer.product.code}
      if offer.bulk_purchase
        if xx.count >= offer.count
          @products.delete_if { |k,v| v.code == offer.product.code }
          @total += (offer.price * xx.count)
        end
      else
        unless xx.count < offer.count
          coef = xx.count / offer.count
          coef.times do |iteration|
            xx.first(offer.count).each {|item| xx.delete(item[0]); @products.delete(item[0])}
            @total += offer.price
          end
        end
      end
    end
end
