class CreateData < ActiveRecord::Migration
  def self.up
    create_table :data do |t|
      t.references :owner
      t.text :encrypted_data

      t.timestamps
    end
  end

  def self.down
    drop_table :data
  end
end
