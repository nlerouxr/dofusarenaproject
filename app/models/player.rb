class Player < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :game

  validates :current_hp, :current_action_points, :current_movement_points,  presence: true
  validates_uniqueness_of :user_id, scope: :game_id
  validate :game_players_limit

  def game_players_limit
    if game.players.count >= 2
      errors.add(:game, "ne peux pas contenir plus de deux joueurs")
    end
  end
end
