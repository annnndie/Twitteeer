FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    account { 'account' + SecureRandom.hex(3) }
    password { Faker::Internet.password }
  end
end
