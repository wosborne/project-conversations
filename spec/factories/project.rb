FactoryBot.define do
  factory :project do
    name { Faker::Movies::StarWars.vehicle }
    
  end
end
