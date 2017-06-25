class CreateOrderForms < ActiveRecord::Migration[5.0]
  def change
    create_table :order_forms do |t|
      t.integer :total
      t.integer :state

      t.timestamps
    end
  end
end
