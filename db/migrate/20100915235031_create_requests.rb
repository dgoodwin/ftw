class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.references :user
      t.references :league
      t.datetime :time
      t.string :comments
      t.string :request_type
      t.integer :entity_id

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
