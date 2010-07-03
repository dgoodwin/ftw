class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.datetime :time
      t.references :season

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
