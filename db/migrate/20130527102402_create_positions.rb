class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title, :null => false, :default => '0'
      t.boolean :location, :default => 3, :null => false   #推荐位 ：1首页轮播，2首页2区（轮播下1）,3首页3区,4首页4区（轮播下3）。通过location字段区分推荐位位置。
      t.string :image, :null => false, :default => '0'
      t.string :url, :default => 'http://www.seearm.com'
      t.text :desc

      t.timestamps
    end
    add_index :positions, [:location], :name => 'location'
  end
end
