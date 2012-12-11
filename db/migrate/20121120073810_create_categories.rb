class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.boolean :type #分类类型：新闻分类，产品分类共用一张表。通过type字段区分是什么分类。
      t.text :desc

      t.timestamps
    end
  end
end
