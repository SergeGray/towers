class CreateGameTurns < ActiveRecord::Migration[8.1]
  def change
    create_table :game_turns do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :targetable, polymorphic: true, index: true
      t.references :originable, polymorphic: true, index: true
      t.references :destinationable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
