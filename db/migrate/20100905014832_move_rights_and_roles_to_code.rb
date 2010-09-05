class MoveRightsAndRolesToCode < ActiveRecord::Migration
  def self.up
    add_column :permissions, :role, :string, :limit => 50
    remove_column :permissions, :role_id
    drop_table :roles
    drop_table :rights
  end

  def self.down
    # TODO: no going back for this one
  end
end
