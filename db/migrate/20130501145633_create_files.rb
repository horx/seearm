class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string   :file_name
      t.integer  :file_size
      t.integer  :user_id
      t.boolean  :type
      t.timestamps
    end
  end
end
