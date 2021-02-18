FactoryBot.define do
  factory :order_address do

    postalcode            { '111-1111' }
    prefecture_id         { Faker::Number.within(range: 1..47) }
    town                  { '渋谷'}
    address               { '鉢山' }
    phone_number          { Faker::Number.number(digits: 11) }
    token                 { "tok_abcdefghijk00000000000000000" }
    
  end
end
