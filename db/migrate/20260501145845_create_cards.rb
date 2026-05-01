class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :type, null: false, default: 0
      t.integer :rarity, null: false, default: 0
      t.integer :faction, null: false, default: 0
      t.integer :strength, null: false, default: 0

      t.timestamps
    end
  end
end
