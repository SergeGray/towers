class CreatePlayers < ActiveRecord::Migration[8.1]
  def change
    create_table :players do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.boolean :first_player, null: false, default: true

      t.timestamps
    end
  end
end
