class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :health_point
      t.integer :action_point
      t.integer :movement_point

      t.timestamps
    end
  end
end
