class CreateWeathers < ActiveRecord::Migration
  def self.up
    create_table :weathers do |t|
      t.references :game
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :weathers
  end
end
