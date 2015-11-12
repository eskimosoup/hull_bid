class Project < ActiveRecord::Base

  belongs_to :page

  mount_uploader :image_1, ProjectImageUploader
  mount_uploader :image_2, ProjectImageUploader
  mount_uploader :image_3, ProjectImageUploader
  mount_uploader :image_4, ProjectImageUploader
  mount_uploader :image_5, ProjectImageUploader
  
  validates :title, :page_id, :image_1, :image_2, :image_3, :image_4, :image_5, {:presence => true}

end
