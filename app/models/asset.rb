class Asset < ActiveRecord::Base
  attr_accessible :image, :image_file_name, :image_content_type, :image_file_size, :portfolio_item_id, :order
  
  belongs_to :portfolio_item
  
  has_attached_file :image,
    :styles => {
      :thumb => "85x85#",
      :large => "600x600>"
               },
    :storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV["S3_KEY"],
      :secret_access_key => ENV["S3_SECRET"]
                       },
    :bucket => ENV["S3_BUCKET"],
    :path => "portfolio/:attachment/:id/:style/:basename.:extension"
   
  before_image_post_process do |image|
    if image_changed?
      processing = true
      false
    end
  end

  after_save do |image|
    if image.image_changed?
      image.delay.regenerate_styles!
    end
  end

  def regenerate_styles!
    self.image.reprocess!
    self.processing = false
    self.save(false)
  end

  def image_changed?
    self.image_file_size_changed? ||
    self.image_file_name_changed? ||
    self.image_content_type_changed?
  end
end

