class TeamMember < ActiveRecord::Base
  
  has_many :pages
  
  mount_uploader :image, MemberImageUploader
    
  validates :name, :role, {:presence => true}
  validates :email, { :email => true, :if => "!email.blank?"}
  
  CATEGORIES = [
    "Communication",
    "Collaboration",
    "Promotion",
    "Innovation",
    "Operations"
  ]
end
