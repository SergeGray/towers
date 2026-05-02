class CreateHands < ActiveRecord::Migration[8.1]
  def change
    create_table :hands do |t|
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
