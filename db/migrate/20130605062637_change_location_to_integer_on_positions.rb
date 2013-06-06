class ChangeLocationToIntegerOnPositions < ActiveRecord::Migration
  def self.up
    change_table :positions do |t|
      t.change :location, :integer, :default => 3, :null => false
    end
  end

  def self.down
    change_table :positions do |t|
      t.change :location, :boolean
    end
  end
end
