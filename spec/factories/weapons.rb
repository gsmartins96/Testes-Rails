FactoryBot.define do
  factory :weapon do
    name { FFaker::Name.first_name }
    description { FFaker::Tweet.body }
    power_base { FFaker::Random.rand(1..20) }
    power_step { FFaker::Random.rand(1..10) }
    level { FFaker::Random.rand(1..50) }
  end
end
