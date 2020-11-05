FactoryBot.define do
  factory :order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '横浜市' }
    address { '青山1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09077776666' }
  end
end
