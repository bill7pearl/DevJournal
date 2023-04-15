FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User Name #{n}" }
  end
end
