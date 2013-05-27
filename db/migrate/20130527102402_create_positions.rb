class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.boolean :location, :default => 3 #推荐位 ：1首页轮播，2首页2区（轮播下1）,3首页3区（轮播下3）。通过location字段区分推荐位位置。
      t.string :image
      t.string :url
      t.text :desc

      t.timestamps
    end
  end
end
