class RenameRoundToEvent < ActiveRecord::Migration
  def self.up
    rename_table('rounds', 'events')
    rename_column('races', 'round_id', 'event_id')
  end

  def self.down
    rename_table('events', 'rounds')
    rename_column('races', 'event_id', 'round_id')
  end
end
