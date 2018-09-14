require 'checkout'

describe Checkout do
  before(:all) do
    @voucher = Product.new('VOUCHER', 'Cabify Voucher', 5.00)
    @tshirt  = Product.new('TSHIRT', 'Cabify T-Shirt', 20.00)
    @mug     = Product.new('MUG', 'Cafify Coffee Mug', 7.50)

    @marketing_offer = PricingRule.new(2, @voucher.price, @voucher)
    @fco_offer       = PricingRule.new(3, 19.00, true, @tshirt)
    @pricing_rules = [@marketing_offer, @fco_offer]
  end

  describe 'Initialization' do
    it '.new' do
      co = Checkout.new([@marketing_offer])
      expect(co).to have_attributes(products: [], pricing_rules: [@marketing_offer])
    end
  end

  describe "#scan" do
    it 'add product to checkout product list' do
      co = Checkout.new([@marketing_offer, @fco_offer])
      expect {
        co.scan(@voucher.code)
      }.to change(co.products, :count).by(1)
    end
  end

  describe "#total" do
    it 'count all prices if no offer applied' do
      co = Checkout.new(@pricing_rules)
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      co.scan('MUG')
      expect(co.total).to eq '32.5'
    end

    it 'applies 2 for 1 offer' do
      co = Checkout.new(@pricing_rules)
      co.scan("VOUCHER")
      co.scan("VOUCHER")
      co.scan("TSHIRT")
      expect(co.total).to eq '25.0'
    end

    it 'applies bulk offer' do
      co = Checkout.new(@pricing_rules)
      co.scan('TSHIRT')
      co.scan('TSHIRT')
      co.scan('TSHIRT')
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      expect(co.total).to eq '81.0'
    end

    it 'applies multiple offers' do
      co = Checkout.new(@pricing_rules)
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
