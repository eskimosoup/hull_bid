class Resource < ActiveRecord::Base
  acts_as_taggable_on :categories
   
  mount_uploader :document, Chronicler::DocumentUploader
  
  validates :name, :presence => true
  
end
