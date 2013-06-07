class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :name, :null => false, :default => '0'
      t.integer :category_id, :null => false, :default => '0'
      t.text :content
      t.timestamps
    end
  end
end
