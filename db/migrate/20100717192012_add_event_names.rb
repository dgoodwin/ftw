class AddEventNames < ActiveRecord::Migration

  def self.up
    add_column :events, :name, :string, :limit => 50
  end

  def self.down
    remove_column :events, :name
  end

end
