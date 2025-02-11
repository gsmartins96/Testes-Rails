class Weapon < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :level, numericality: { greater_than: 0,
                                    less_than_or_equal_to: 50 }

  def current_power
    "#{self.power_base + ((self.level-1) * self.power_step)}"
  end

  def title
    "#{self.name}, #{self.level}"
  end
end
