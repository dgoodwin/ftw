class AddRaceIndex < ActiveRecord::Migration
  def self.up
    add_column :races, :index, :integer
  end

  def self.down
    remove_column :races, :index
  end
end
