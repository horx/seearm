class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false, :default => "0"
      t.string :slug, :null => false, :default => "0"
      t.integer :parent_id, :null => false, :default => '0' #父分类ID
      t.boolean :ctype, :null => false, :default => 1 #分类类型：4选购指南,3网站信息,2新闻分类，1产品分类,共用一张表。通过type字段区分是什么分类。
      t.text :desc

      t.timestamps
    end

    add_index :categories, [:slug], :name => 'category_slug'
  end
end
