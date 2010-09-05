class RenameUserLoginToEmail < ActiveRecord::Migration
  def self.up
    rename_column :users, :login, :email
  end

  def self.down
    rename_column :users, :email, :login
  end
end
