require 'pricing_rule'

RSpec.describe PricingRule do
  context 'Initialization' do
    it '.new' do
      voucher = Product.new('VOUCHER', 'Cabify Voucher', 5.00)
      marketing_offer = PricingRule.new(2, voucher.price, voucher)
      expect(marketing_offer).to have_attributes(count: 2, price: 5.00, bulk_purchase: false, product: voucher)
    end
  end
end
