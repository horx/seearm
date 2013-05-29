class RenamePidToParentIdOnCategories < ActiveRecord::Migration
  def self.up
    rename_column :categories, :pid, :parent_id
  end

  def self.down
    rename_column :categories, :parent_id, :pid
  end
end
