class BusinessHighlight < ActiveRecord::Base
  
  mount_uploader :image_1, BusinessHighlightImageUploader
  mount_uploader :image_2, BusinessHighlightImageUploader
  mount_uploader :image_3, BusinessHighlightImageUploader
  mount_uploader :image_4, BusinessHighlightImageUploader
  
  validates :name, :summary, :date, :presence => true   
  
end
