module Admin
  class EventGalleryImagesController < Manticore::ApplicationController

    crops_images_for EventGalleryImage, :image, {
      :small => { :fill => [120, 120] }, :events_page => { :fill => [437, 176] }, :shadowbox => { :fit => [800, 600]}
    }

    before_filter { @event_gallery = EventGallery.find(params[:event_gallery_id]) }

    def index
      @event_gallery_images = @event_gallery.event_gallery_images.order(:position)
    end

    def new
      @event_gallery_image = EventGalleryImage.new(:event_gallery_id => @event_gallery.id)
    end

    def create
      respond_to do |format|
        format.html{
          @event_gallery_image = EventGalleryImage.new(params[:event_gallery_image])
          if @event_gallery_image.save
            redirect_to admin_event_gallery_event_gallery_images_path, :notice => "Event gallery image successfully created."
          else
            render :action => 'new'
          end
        }
        format.js{
          @event_gallery_image = EventGalleryImage.create(params[:event_gallery_image])
        }
      end
    end

    def edit
      @event_gallery_image = EventGalleryImage.find(params[:id])
    end

    def update
      @event_gallery_image = EventGalleryImage.find(params[:id])
      if @event_gallery_image.update_attributes(params[:event_gallery_image])
        redirect_to admin_event_gallery_event_gallery_images_path, :notice => "Event gallery image successfully updated."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @event_gallery_image = EventGalleryImage.find(params[:id])
      @event_gallery_image.destroy
      redirect_to admin_event_gallery_event_gallery_images_path, :notice => "Event gallery image destroyed."
    end

  end
end
