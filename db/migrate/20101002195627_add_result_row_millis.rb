class AddResultRowMillis < ActiveRecord::Migration
  def self.up
    add_column :race_result_rows, :millis, :integer
    change_column :race_result_rows, :time, :string, :limit => 15
  end

  def self.down
    remove_column :race_result_rows, :millis
  end
end
