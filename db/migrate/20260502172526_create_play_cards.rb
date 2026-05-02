class CreatePlayCards < ActiveRecord::Migration[8.1]
  def change
    create_table :play_cards do |t|
      t.references :player, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
