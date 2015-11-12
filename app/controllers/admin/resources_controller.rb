module Admin
  class ResourcesController < Manticore::ApplicationController

    helper :form

    def index
      @resources = Resource.where(
        ["name LIKE :search OR summary LIKE :search OR document_title LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "name").page(params[:page])
    end
    
    def new
      @resource = Resource.new
    end
    
    def create
      @resource = Resource.new(params[:resource])
      if @resource.save
        redirect_to admin_resources_path, :notice => "Resource successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @resource = Resource.find(params[:id])
    end
    
    def update
      @resource = Resource.find(params[:id])
      if @resource.update_attributes(params[:resource])
        redirect_to admin_resources_path, :notice => "Resource successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @resource = Resource.find(params[:id])
      @resource.destroy
      redirect_to admin_resources_path, :notice => "Resource destroyed."
    end
    
  end
end
