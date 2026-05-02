class CreateCardFactions < ActiveRecord::Migration[8.1]
  def change
    create_table :card_factions do |t|
      t.references :card, null: false, foreign_key: true
      t.references :faction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
