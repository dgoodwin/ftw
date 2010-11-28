class SwitchPPtoPower < ActiveRecord::Migration
  def self.up
    rename_column :events, :pp, :power
  end

  def self.down
  end
end
