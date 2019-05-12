require 'rails_helper'

RSpec.describe Weapon, type: :model do
  name = FFaker::Name.first_name
  description = FFaker::Tweet.body 
  power_base = FFaker::Random.rand(1..20) 
  power_step = FFaker::Random.rand(1..10) 
  level = FFaker::Random.rand(1..50) 

  it "return the correct title of weapon" do
    weapon = create(:weapon, name: name, description: description, 
                    power_base: power_base, power_step: power_step, level: level)
    expect(weapon.title).to eq("#{name}, #{level}")
  end
  
  it "is invalid if the level was more than 50" do
    weapon = build(:weapon, level: FFaker::Random.rand(51..999))
    expect(weapon).to_not be_valid
  end
end
