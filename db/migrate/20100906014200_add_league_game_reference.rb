class AddLeagueGameReference < ActiveRecord::Migration
  def self.up
    add_column :leagues, :game_id, :integer
  end

  def self.down
    drop_column :leagues, :game_id
  end
end
