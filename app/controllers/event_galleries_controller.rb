class EventGalleriesController < ApplicationController

  def index
    @event_galleries = EventGallery.where(:display => true).order("created_at desc")
  end

  def show
    @event_galleries = EventGallery.where(:display => true).order("created_at desc")
    @event_gallery = EventGallery.find(params[:id])
    @business_highlight = BusinessHighlight.where(:display => true).order("date desc").first
  end

end
