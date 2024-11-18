FactoryBot.define do
  factory :user do
    sequence(:id)
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.unique.password }
    phone { Faker::PhoneNumber.cell_phone }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
