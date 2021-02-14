FactoryBot.define do
  factory :item do
    association :user

    title                      {Faker::Lorem.word}
    text                       {Faker::Lorem.sentence}
    price                      {Faker::Number.within(range: 300..9999999)}             
    prefecture_id              {Faker::Number.within(range: 1..47)}
    condition_id               {Faker::Number.within(range: 1..6)}
    category_id                {Faker::Number.within(range: 1..10)}
    delivery_fee_id            {Faker::Number.within(range: 1..2)}
    estimated_shipping_date_id {Faker::Number.within(range: 1..3)}
  end
end
