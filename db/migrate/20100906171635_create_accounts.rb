class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.references :user
      t.references :platform
      t.boolean :verified, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
