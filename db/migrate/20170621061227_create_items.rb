class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.string :introduction
      t.string :picture_addr

      t.timestamps
    end
  end
end
