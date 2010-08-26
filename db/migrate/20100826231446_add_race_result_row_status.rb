class AddRaceResultRowStatus < ActiveRecord::Migration
  def self.up
    add_column :race_result_rows, :status, :string, :limit => 50, :default => 'finished'
  end

  def self.down
    remove_column :race_result_rows, :status
  end
end
