class Achievement < ActiveRecord::Base
  acts_as_taggable
  
  mount_uploader :image, AchievementImageUploader
  
  validates :name, :summary, :main_content, :date, {:presence => true}
end
