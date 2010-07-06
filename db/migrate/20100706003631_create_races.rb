class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.datetime :time
      t.references :round
      t.text :instructions
      t.string :password
      t.references :users

      t.timestamps
    end

    create_table :races_users, :id => false do |t|
      t.references :race, :user
    end
  end

  def self.down
    drop_table :races
    drop_table :races_users
  end
end
