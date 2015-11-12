class Page < ActiveRecord::Base
  
  belongs_to :team_member
  has_many :projects

  validates :title, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

  is_a_leaf

  mount_uploader :image, PageImageUploader

  def name
    title
  end

  def route
    "{:controller => '/pages', :action => 'show', :id => '#{self.slug}'}"
  end

  def meta_tags=value
    self[:meta_tags] = value.strip.blank? ? nil : value
  end
  
  def meta_description=value
    self[:meta_description] = value.strip.blank? ? nil : value
  end

  def self.layouts
    %w{ application }
  end

  def self.styles
    %w{ about basic contact_us what_we_do what_we_do_sub }
  end

end
