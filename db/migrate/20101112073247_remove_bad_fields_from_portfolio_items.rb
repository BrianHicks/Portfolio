class RemoveBadFieldsFromPortfolioItems < ActiveRecord::Migration
  def self.up
    remove_column :portfolio_items, :live
  end

  def self.down
    add_column :portfolio_items, :live, :boolean, :default => false
  end
end
