class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name, :null => false, :default => "0"
      t.integer :category_id, :null => false, :default => "4"
      t.string :file, :null => false, :default => "0"
      t.text :content

      t.timestamps
    end
  end
end
