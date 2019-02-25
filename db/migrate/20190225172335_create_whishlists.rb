class CreateWhishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :whishlists do |t|
      t.integer :quantity
      t.references :item, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
