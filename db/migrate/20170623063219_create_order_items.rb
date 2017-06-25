class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_form_id
      t.integer :item_count

      t.timestamps
    end
  end
end
