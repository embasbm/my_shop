require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_attribute(:code) }
  it { should have_attribute(:name) }
  it { should have_attribute(:price) }
end
