class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :level
      t.integer :parent_id
      t.string :introduction
      t.string :picture_addr

      t.timestamps
    end
  end
end
