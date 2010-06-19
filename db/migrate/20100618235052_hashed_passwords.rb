class HashedPasswords < ActiveRecord::Migration
  def self.up
    rename_column :users, :password, :hashed_password
  end

  def self.down
  end
end
