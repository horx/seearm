class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, :null => false, :default => '0'
      t.string :slug, :null => false, :default => '0'
      t.integer :category_id, :null => false, :default => '0'
      t.text :content
      t.timestamps
    end
    add_index :pages, [:slug], :name => 'page_slug'
  end
end
