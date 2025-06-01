class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.references :user, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :current_hp
      t.integer :current_action_points
      t.integer :current_movement_points

      t.timestamps
    end
  end
end
