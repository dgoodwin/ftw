class AddRaceHost < ActiveRecord::Migration
  def self.up
    add_column :races, :host_id, :integer
  end

  def self.down
    remove_column :races, :host_id
  end
end
