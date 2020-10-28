FactoryBot.define do
  factory :item do
    association :user

    product_name { 'aあア亜' }
    description { 'a亜あア1' }
    price { 300 }
    category_id { 2 }
    states_id { 2 }
    delivery_charge_id { 2 }
    area_id { 2 }
    day_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
