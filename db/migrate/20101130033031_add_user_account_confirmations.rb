class AddUserAccountConfirmations < ActiveRecord::Migration
  def self.up
    alter_table(:users) do |t|
      t.confirmable
    end
  end

  def self.down
    remove_column :users, :confirmed_at
  end
end
