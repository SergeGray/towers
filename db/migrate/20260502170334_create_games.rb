class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.integer :state, null: false, default: 0
      t.boolean :first_player_turn, null: false, default: true

      t.timestamps
    end
  end
end
