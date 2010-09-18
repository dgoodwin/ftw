class CreateRegistrants < ActiveRecord::Migration
  def self.up
    create_table :registrants do |t|
      t.references :event
      t.references :member

      t.timestamps
    end
  end

  def self.down
    drop_table :registrants
  end
end
