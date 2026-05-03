class CreateBoardRows < ActiveRecord::Migration[8.1]
  def change
    create_table :board_rows do |t|
      t.references :board, null: false, foreign_key: true
      t.integer :position, null: false

      t.timestamps
    end
  end
end
