class Business < ActiveRecord::Base
  acts_as_taggable_on :categories

  validates :name, :presence => true
  mount_uploader :logo, BusinessImageUploader
end
