FactoryBot.define do
  factory :status do
    association :user
    content { Faker::Verb.base }
  end
end
