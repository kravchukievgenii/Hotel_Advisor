class RemoveColumns < ActiveRecord::Migration
  def self.up
    remove_column :hotels, :address
  end

  def self.down
    add_column :hotels, :address, :string
  end
end
