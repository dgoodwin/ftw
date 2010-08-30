class AddRoleKeys < ActiveRecord::Migration
  def self.up
    add_column :roles, :key, :string, :limit => 30
    remove_column :roles, :right_id
  end

  def self.down
    remove_column :roles, :key
  end
end
