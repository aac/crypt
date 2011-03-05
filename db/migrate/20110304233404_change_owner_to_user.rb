class ChangeOwnerToUser < ActiveRecord::Migration
  def self.up
    rename_column :values, :owner_id, :user_id
  end

  def self.down
    rename_column :values, :user_id, :owner_id
  end
end
