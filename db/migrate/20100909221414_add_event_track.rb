class AddEventTrack < ActiveRecord::Migration
  def self.up
    add_column :events, :track_id, :integer
  end

  def self.down
    remove_column :events, :track_id
  end
end
