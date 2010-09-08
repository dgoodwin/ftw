class AddCanHostToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :can_host, :integer, :default => 0
  end

  def self.down
    remove_column :accounts, :can_host
  end
end
