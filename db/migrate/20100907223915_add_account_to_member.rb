class AddAccountToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :account_id, :integer
  end

  def self.down
    remove_column :members, :account_id
  end
end
