class Game < ApplicationRecord

  STATUS = %w[pending full in_progress finished]

  has_many :players, dependent: :destroy
  has_many :users, through: :players
  has_many :characters, through: :players

  belongs_to :winner, class_name: "User", optional: true
  belongs_to :current_player_turn, class_name: "Player", optional: true

  validates :status, presence: true, inclusion: { in: STATUS }

end
