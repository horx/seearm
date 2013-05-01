class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string   :file_name
      t.integer  :file_size
      t.integer  :user_id
      t.boolean  :type
      t.timestamps
    end
  end
end
