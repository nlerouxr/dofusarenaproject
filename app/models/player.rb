class Player < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :game

  validates :current_hp, :current_action_points, :current_movement_points,  presence: true
  validates_uniqueness_of :user_id, scope: :game_id
end
