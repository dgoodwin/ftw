class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.references :game
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
