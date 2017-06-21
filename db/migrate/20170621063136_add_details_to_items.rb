class AddDetailsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :price, :decimal, precision: 5, scale: 2
  end
end
