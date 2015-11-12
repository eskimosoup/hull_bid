class EventsController < ApplicationController

  def index
		@current_branch = Willow::Branch.find_by_name('Events')
		params[:page] ||= 1
    if params[:category]
      @title = "#{params[:category]} Events"
      search = Event.where(:display => true).tagged_with(params[:category].to_s, :on => "categories")
    elsif params[:year] && params[:month]
      @title = "#{Date::MONTHNAMES[params[:month].to_i]} #{params[:year]} Events"
      search = Event.where(:display => true).year(params[:year]).month(params[:month])
    elsif params[:year]
      @title = "#{params[:year]} Events"
      search = Event.where(:display => true).year(params[:year])
    else
      @title = "Upcoming/Current Events"
      search = Event.where(
        ["display = ? AND ((end_date IS NULL AND start_date >= ?) OR (end_date IS NOT NULL AND end_date >= ?))", true, Date.today, Date.today]
      )
    end
    @events = search.order("start_date ASC").page(params[:page]).per(10)
    @default_gallery = DefaultGalleryImage.where(:display => true).order(:position).first

    @business_highlight = BusinessHighlight.where(:display => true).order("date desc").first
  end

  def show
    @event = Event.find(params[:id])
    @current_branch = Willow::Branch.find_by_name('Events')
    @business_highlight = BusinessHighlight.where(:display => true).order("date desc").first
  end

end
