class Article < ActiveRecord::Base
  acts_as_taggable_on :categories

  
  mount_uploader :image, ArticleImageUploader
  
  validates :headline, :summary, :main_content, :date, {:presence => true}
  
  scope :year, lambda{|year| {:conditions => ["year(date) = ?", year]}}
  scope :month, lambda{|month| {:conditions => ["month(date) = ?", month]}}
  
  def self.years
    Article.where(:display => true).collect{|a| a.date.year}.uniq.sort
  end
  
  def self.months(year)
    Article.where(:display => true).year(year).collect{|a| a.date.month}.uniq.sort
  end

end
