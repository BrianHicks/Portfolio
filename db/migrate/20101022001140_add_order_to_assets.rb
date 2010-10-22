class AddOrderToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :order, :integer
  end

  def self.down
    remove_column :assets, :order
  end
end
