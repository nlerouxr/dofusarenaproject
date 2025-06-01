class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :status
      t.integer :current_turn
      t.datetime :timer_started_at
      t.references :winner, null: true, foreign_key: { to_table: :users }
      t.references :current_player_turn, null: true, foreign_key: { to_table: :players }
      t.timestamps
    end
  end
end
