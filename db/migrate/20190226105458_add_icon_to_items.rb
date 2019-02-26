class AddIconToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :icon, :string
  end
end
