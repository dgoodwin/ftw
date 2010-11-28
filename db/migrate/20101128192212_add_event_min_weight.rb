class AddEventMinWeight < ActiveRecord::Migration
  def self.up
    add_column :events, :weight, :integer
  end

  def self.down
    remove_column :events, :weight
  end
end
