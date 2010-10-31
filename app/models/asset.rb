class Asset < ActiveRecord::Base
  attr_accessible :image, :image_file_name, :image_content_type, :image_file_size, :portfolio_item_id, :order
  
  belongs_to :portfolio_item
  
  has_attached_file :image,
    :styles => {
      :thumb => "20x20#",
      :small => "100x100",
      :large => "600x600>"
               },
    :storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV["S3_KEY"],
      :secret_access_key => ENV["S3_SECRET"]
                       },
    :bucket => ENV["S3_BUCKET"],
    :path => "portfolio/:attachment/:id/:style/:basename.:extension"
   
end
