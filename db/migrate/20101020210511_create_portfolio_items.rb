class CreatePortfolioItems < ActiveRecord::Migration
  def self.up
    create_table :portfolio_items do |t|
      t.string :content
      t.string :title
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :portfolio_items
  end
end
