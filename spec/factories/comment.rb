FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.words(number: rand(2..10)) }
  end
end
