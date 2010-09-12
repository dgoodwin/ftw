class CreateTires < ActiveRecord::Migration
  def self.up
    create_table :tires do |t|
      t.references :game
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :tires
  end
end
