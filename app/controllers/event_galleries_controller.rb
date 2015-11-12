class EventGalleriesController < ApplicationController
  
  def index
    @event_galleries = EventGallery.where(:display => true).order(:position)
  end
  
  def show
    @event_galleries = EventGallery.where(:display => true).order(:position)
    @event_gallery = EventGallery.find(params[:id])
    @business_highlight = BusinessHighlight.where(:display => true).order(:date).first
  end    
    
end
