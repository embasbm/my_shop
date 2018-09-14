require 'rails_helper'

describe CheckoutService do
  before(:all) do
    @voucher = FactoryBot.create(:product, code: 'VOUCHER',name: 'Cabify Voucher', price: 5.00)
    @tshirt = FactoryBot.create(:product, code: 'TSHIRT',name: 'Cabify T-Shirt', price: 20.00)
    @mug = FactoryBot.create(:product, code: 'MUG',name: 'Cafify Coffee Mug', price: 7.50)
    @marketing_offer = FactoryBot.create(:pricing_rule, count: 2, price: @voucher.price, product: @voucher)
    @fco_offer = FactoryBot.create(:pricing_rule, count: 3, price: 19.00, bulk_purchase: true, product: @tshirt)
  end

  describe "#scan" do
    it 'add product to checkout product list' do
      co = CheckoutService.new(PricingRule.all)
      expect {
        co.scan(@voucher.code)
      }.to change(co.products, :count).by(1)
    end
  end

  describe "#total" do
    it 'count all prices if no offer applied' do
      pricing_rules = PricingRule.all
      co = CheckoutService.new(pricing_rules)
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      co.scan('MUG')
      expect(co.total).to eq '32.5'
    end

    it 'applies 2 for 1 offer' do
      pricing_rules = PricingRule.all
      co = CheckoutService.new(pricing_rules)
      co.scan("VOUCHER")
      co.scan("VOUCHER")
      co.scan("TSHIRT")
      expect(co.total).to eq '25.0'
    end

    it 'applies bulk offer' do
      pricing_rules = PricingRule.all
      co = CheckoutService.new(pricing_rules)
      co.scan('TSHIRT')
      co.scan('TSHIRT')
      co.scan('TSHIRT')
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      expect(co.total).to eq '81.0'
    end

    it 'applies multiple offers' do
      pricing_rules = PricingRule.all
      co = CheckoutService.new(pricing_rules)
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      co.scan('VOUCHER')
      co.scan('VOUCHER')
      co.scan('MUG')
      co.scan('TSHIRT')
      co.scan('TSHIRT')
      expect(co.total).to eq '74.5'
    end
  end
end
