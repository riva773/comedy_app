FactoryBot.define do
  factory :user do
    sequence(:nickname, "user_1")
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'Password1' }
    password_confirmation { 'Password1' }
  end
end
