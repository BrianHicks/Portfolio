class PortfolioItem < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :assets_attributes, :category
  
  belongs_to :user
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  default_scope :order => "updated_at DESC"
  
end
