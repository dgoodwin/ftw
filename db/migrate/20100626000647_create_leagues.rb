class CreateLeagues < ActiveRecord::Migration

  def self.up
    create_table :leagues do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :members do |t|
      t.references :league
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :leagues
    drop_table :members
  end

end
