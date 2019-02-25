class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.integer :price_in_cent
      t.integer :quantity
      t.references :whishlist, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
