FactoryBot.define do
  factory :product do
    code { Faker::Code.asin }
    name { Faker::Name.name }
    price { Faker::Number.decimal(2, 2) }
  end
end
