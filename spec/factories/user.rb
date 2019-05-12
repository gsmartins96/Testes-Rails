FactoryBot.define do
  factory :user do
    nickname { FFaker::Name.first_name}
    level { FFaker::Random.rand(1..99) }
    kind { %w[wizard knight].sample }
  end
end