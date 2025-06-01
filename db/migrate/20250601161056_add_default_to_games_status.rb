class AddDefaultToGamesStatus < ActiveRecord::Migration[7.1]
  def change
     change_column_default :games, :status, from: nil, to: "pending"
  end
end
