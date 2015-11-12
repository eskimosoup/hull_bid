module Admin
  class EventGalleriesController < Manticore::ApplicationController
  
    def index
      @event_galleries = EventGallery.order(:position)
    end
    
    def new
      @event_gallery = EventGallery.new
    end
    
    def create
      @event_gallery = EventGallery.new(params[:event_gallery])
      if @event_gallery.save
        redirect_to admin_event_galleries_path, :notice => "Event gallery successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @event_gallery = EventGallery.find(params[:id])
    end
    
    def update
      @event_gallery = EventGallery.find(params[:id])
      if @event_gallery.update_attributes(params[:event_gallery])
        redirect_to admin_event_galleries_path, :notice => "Event gallery successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @event_gallery = EventGallery.find(params[:id])
      @event_gallery.destroy
      redirect_to admin_event_galleries_path, :notice => "Event gallery destroyed."
    end
    
  end
end
