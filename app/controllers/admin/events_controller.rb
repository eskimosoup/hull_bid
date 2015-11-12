module Admin
  class EventsController < Manticore::ApplicationController

    helper :form
    crops_images_for Event, :image, { :show => { :fit => [440, 1000] } }

    def index
      @events = Event.where(
        ["headline LIKE :search OR summary LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "start_date DESC").page(params[:page]).per(10)
    end
    
    def new
      @event = Event.new
    end
    
    def create
      @event = Event.new(params[:event])
      if @event.save
        redirect_to admin_events_path, :notice => "Event successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @event = Event.find(params[:id])
    end
    
    def update
      @event = Event.find(params[:id])
      if @event.update_attributes(params[:event])
        redirect_to admin_events_path, :notice => "Event successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to admin_events_path, :notice => "Event destroyed."
    end
    
  end
end
