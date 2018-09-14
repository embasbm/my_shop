require 'product'

RSpec.describe Product do
  context 'Initialize methods' do
    subject { Product.new }
    it { should have_attribute(:code) }
    it { should have_attribute(:name) }
    it { should have_attribute(:price) }
    end
  end
end
