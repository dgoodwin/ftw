class CreateRaceResults < ActiveRecord::Migration
  def self.up
    create_table :race_results do |t|
      t.references :race
      t.references :user
      t.boolean :final

      t.timestamps
    end
  end

  def self.down
    drop_table :race_results
  end
end
