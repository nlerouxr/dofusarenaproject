# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Player.destroy_all
Character.destroy_all
User.destroy_all
Game.destroy_all

puts "création d'utilisateurs"

users = []
5.times do |i|
  user = User.create(
  username: "user#{i+1}",
  password: "Password#{i+1}&"
)
  users << user
end

puts 'création de personnages'

characters = []
5.times do |i|
  character = Character.create(
    name: "Hero#{i+1}",
    health_point: rand(80..120),
    action_point: rand(2..5),
    movement_point: rand(3..6)
  )
  characters << character
end

puts "creation d'une partie"

game = Game.create(
  status: "pending",
  current_turn: 0,
  timer_started_at: nil,
  winner_id: nil,
  current_player_turn_id: nil
)

puts "crétion d'un joueur associé à la partie"

  Player.create(
    user_id: users[0].id,
    character_id: characters[0].id,
    game_id: game.id,
    current_hp: characters[0].health_point,
    current_action_points: characters[0].action_point,
    current_movement_points: characters[0].movement_point
  )

puts "Seed terminée : #{User.count} users, #{Character.count} characters, #{Player.count} players, #{Game.count} game créée."
