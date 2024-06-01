FactoryBot.define do
  factory :user do
    sequence(:nickname, "user_1")
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'Password' }
    password_confirmation { 'Password' }
  end
end
