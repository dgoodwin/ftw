class AddSeasonStartEndDates < ActiveRecord::Migration
  def self.up
    add_column :seasons, :start_date, :date
    add_column :seasons, :end_date, :date
  end

  def self.down
    remove_column :seasons, :start_date
    remove_column :seasons, :end_date
  end
end
