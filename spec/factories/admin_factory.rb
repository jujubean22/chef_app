FactoryBot.define do
  factory :admin do
    id {1}
    association :user
  end
end
