class CreateRaceResultRows < ActiveRecord::Migration
  def self.up
    create_table :race_result_rows do |t|
      t.integer :position
      t.integer :time
      t.references :user
      t.references :race_result

      t.timestamps
    end
  end

  def self.down
    drop_table :race_result_rows
  end
end
