FactoryBot.define do
  factory :pricing_rule do
    product { FactoryBot.create(:product) }
    count { Faker::Number.number(1) }
    price { Faker::Number.decimal(2) }
  end
end
