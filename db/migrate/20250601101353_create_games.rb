class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :status
      t.integer :current_turn
      t.datetime :timer_started_at

      t.timestamps
    end
  end
end
