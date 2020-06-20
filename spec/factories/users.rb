FactoryBot.define do
  factory :user do
    email { 'loveyu@andyu.io' }
    password { '123456' }

    trait :invalid_email do
      email { 'hello' }
    end

    trait :invalid_password do
      password { '1234' }
    end
  end
end
