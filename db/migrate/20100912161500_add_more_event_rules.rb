class AddMoreEventRules < ActiveRecord::Migration
  def self.up
    add_column :events, :tire_id, :integer
    add_column :events, :weather_id, :integer
    add_column :events, :pp, :integer
  end

  def self.down
    remove_column :events, :tire_id
    remove_column :events, :weather_id
    remove_column :events, :pp
  end
end
