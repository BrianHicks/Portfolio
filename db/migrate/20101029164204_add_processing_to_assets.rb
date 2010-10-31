class AddProcessingToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :processing, :boolean
  end

  def self.down
    remove_column :assets, :processing
  end
end
