class Character < ApplicationRecord

  has_many :users, through: :players
  has_many :games, through: :players

  validates :name, presence: true, uniqueness: true
  validates :health_point, :action_point, :movement_point, presence: true

end
