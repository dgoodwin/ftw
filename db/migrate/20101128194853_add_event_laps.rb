class AddEventLaps < ActiveRecord::Migration
  def self.up
    add_column :events, :laps, :integer
    add_column :events, :quali_mins, :integer
  end

  def self.down
    remove_column :events, :laps
    remove_column :events, :quali_mins
  end
end
