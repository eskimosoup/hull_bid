class ApplicationController < ActionController::Base

  protect_from_forgery

  def index
    @current_branch = Willow::StaticPage.find_by_name("Home").branch
    @article = Article.where(:display => true).order('date DESC').first
    @event = Event.where(:display => true).order('start_date DESC').first
    @banners = Banner.where(:display => true).order(:position)
    @achievement = Achievement.where(:display => true).order('date DESC').first
    @business_highlight = BusinessHighlight.where(
      ["display = ? AND image_1 != '' AND image_1 IS NOT NULL", true]
    ).order('date DESC').first
    @newsletter_subscriber = NewsletterSubscriber.new
    year = Date.today.year
    footfall_data_entries = FootfallDataEntry.where("year = ?", year).order("month DESC")
    while footfall_data_entries.blank?
      year -= 1
      footfall_data_entries = FootfallDataEntry.where("year = ?", year).order("month DESC")      
    end
    @footfall_data_entry = footfall_data_entries.first
  end

  def accessibility
    @branches = Willow::Tree.find_by_name("Main Navigation").branches.roots
  end

  def site_map
    @branches = Willow::Tree.find_by_name("Main Navigation").branches.order(:positions_depth_cache)
  end

  def rss
  end

end
