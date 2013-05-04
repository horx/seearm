class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string   :file_name
      t.integer  :file_size
      t.integer  :user_id
      t.boolean  :type, :default => 1 #文件类型 1:图片, 2:其他
      t.timestamps
    end
  end
end
