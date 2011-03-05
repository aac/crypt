class CreateValues < ActiveRecord::Migration
  def self.up
    create_table :values do |t|
      t.references :owner
      t.text :encrypted_data

      t.timestamps
    end
  end

  def self.down
    drop_table :values
  end
end
