class Event < ActiveRecord::Base
  
  has_one :event_gallery
  acts_as_taggable_on :categories
  
  mount_uploader :image, EventImageUploader
  
  validates :headline, :summary, :main_content, :start_date, {:presence => true}
  validate :end_date_after_start

  scope :year, lambda{|year| {:conditions => ["year(start_date) = ?", year]}}
  scope :month, lambda{|month| {:conditions => ["month(start_date) = ?", month]}}
  
  def self.years
    Event.where(:display => true).collect{|a| a.start_date.year}.uniq.sort
  end
  
  def self.months(year)
    Event.where(:display => true).year(year).collect{|a| a.start_date.month}.uniq.sort
  end
  
  def start_date_in_future
    if !start_date.blank? and start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
  
  def end_date_after_start
    if !end_date.blank? and end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end
    
end
