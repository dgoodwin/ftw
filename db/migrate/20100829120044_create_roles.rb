class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.references :right
      t.string :name

      t.timestamps
    end

    create_table :rights_roles, :id => false do |t|
      t.references :role, :right
    end
  end

  def self.down
    drop_table :roles
    drop_table :rights_roles
  end
end
