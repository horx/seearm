class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :pictures
      t.integer :category_id
      t.decimal :price
      t.boolean :status
      t.string :keywords
      t.text :content

      t.timestamps
    end
  end
end
