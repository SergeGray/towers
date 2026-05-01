class CreateDeckCards < ActiveRecord::Migration[8.1]
  def change
    create_table :deck_cards do |t|
      t.references :deck, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.integer :count, null: false, default: 0

      t.timestamps
    end
  end
end
