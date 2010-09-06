class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :key
      t.string :name
      t.references :platform

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
