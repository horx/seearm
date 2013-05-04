class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :pictures
      t.integer :category_id
      t.decimal :price
      t.boolean :status, :default => 0 #产品状态,默认0, 0:未上线,1:上线
      t.string :taobao_url, :default => 'http://seearm.taobao.com'
      t.string :keywords
      t.text :content
      t.text :content_html

      t.timestamps
    end
    add_index :products, [:category_id], :name => 'product_category'
  end
end
