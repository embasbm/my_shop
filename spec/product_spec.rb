require 'product'

RSpec.describe Product do
  context 'Initialization' do
    it '.new' do
      product = Product.new('VOUCHER', 'Cabify Voucher', 5.00)
      expect(product).to have_attributes(code: 'VOUCHER', name: 'Cabify Voucher', price: 5.00)
    end
  end
end
