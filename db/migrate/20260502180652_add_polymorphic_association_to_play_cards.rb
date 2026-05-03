class AddPolymorphicAssociationToPlayCards < ActiveRecord::Migration[8.1]
  def change
    add_reference :play_cards, :placeable, polymorphic: true, index: true
  end
end
