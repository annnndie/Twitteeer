FactoryBot.define do
  factory :user do
    email { 'loveyu@andyu.io' }
    password { '123456' }
    account { 'helloyu' }

    trait :invalid_email do
      email { 'hello' }
    end

    trait :test2_email do
      email { 'helloyu@andyu.io' }
    end

    trait :invalid_password do
      password { '1234' }
    end
  end
end
