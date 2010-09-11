class AddLeagueTypeAndRegType < ActiveRecord::Migration
  def self.up
    add_column :leagues, :racing_type, :string, :limit => 50
    add_column :leagues, :membership, :string, :limit => 50
    add_column :leagues, :skill_level, :string, :limit => 20
  end

  def self.down
    remove_column :leagues, :racing_type
    remove_column :leagues, :membership
    remove_column :leagues, :skill_level
  end
end
