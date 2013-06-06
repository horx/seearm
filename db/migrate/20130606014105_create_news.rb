class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name, :null => false, :default => '0'
      t.integer :category_id, :null => false, :default => '0'
      t.text :content

      t.timestamps
    end
  end
end
