FactoryBot.define do
  factory :enemy do
    name { FFaker::Name.first_name }
    power_base { FFaker::Random.rand(1..999) }
    power_step { FFaker::Random.rand(1..999) }
    level { FFaker::Random.rand(1..99) }
    kind { %w[ goblin orc demon dragon ].sample }
    
  end
end
