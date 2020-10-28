FactoryBot.define do
  factory :user do
    nickname       { Faker::Name.initials(number: 2) }
    email          { Faker::Internet.free_email }
    password       { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    last_name      { '田中' }
    fist_name      { '太郎' }
    last_name_kana { 'タナカ' }
    fist_name_kana { 'タロウ' }
    birthday { '2020-4-1' }
  end
end
