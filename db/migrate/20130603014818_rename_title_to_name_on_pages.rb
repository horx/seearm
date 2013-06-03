class RenameTitleToNameOnPages < ActiveRecord::Migration
  def self.up
    rename_column :pages, :title, :name
  end

  def self.down
    rename_column :pages, :name, :title
  end
end
