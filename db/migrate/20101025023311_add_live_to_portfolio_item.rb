class AddLiveToPortfolioItem < ActiveRecord::Migration
  def self.up
    add_column :portfolio_items, :live, :boolean, :default => 0
  end

  def self.down
    remove_column :portfolio_items, :live
  end
end
