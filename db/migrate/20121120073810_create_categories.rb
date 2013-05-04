class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :pid, :default => 0 #父分类ID
      t.boolean :ctype, :default => 1 #分类类型：2新闻分类，1产品分类,共用一张表。通过type字段区分是什么分类。
      t.text :desc

      t.timestamps
    end

    add_index :categories, [:slug], :name => 'category_slug'
  end
end
