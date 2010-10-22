class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :portfolio_item_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
