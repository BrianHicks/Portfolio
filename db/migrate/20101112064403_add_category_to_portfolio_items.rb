class AddCategoryToPortfolioItems < ActiveRecord::Migration
  def self.up
    add_column :portfolio_items, :category, :string
    add_index :portfolio_items, :category
  end

  def self.down
    remove_column :portfolio_items, :category, :string
    remove_index :portfolio_items, :category
  end
end
