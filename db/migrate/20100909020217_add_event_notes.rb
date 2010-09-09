class AddEventNotes < ActiveRecord::Migration
  def self.up
    add_column :events, :instructions, :text
    remove_column :races, :instructions
  end

  def self.down
    remove_column :events, :instructions
    add_column :races, :instructions, :text
  end
end
