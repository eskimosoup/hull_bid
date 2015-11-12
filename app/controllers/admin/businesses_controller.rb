module Admin
  class BusinessesController < Manticore::ApplicationController
    
    crops_images_for Business, :logo, {
      :show => { :fit => [350, 120] }
    }
    
    def index
      @businesses = Business.where(
        ["name LIKE :search OR email LIKE :search OR website LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "name").page(params[:page])
    end
    
    def new
      @business = Business.new
    end
    
    def create
      @business = Business.new(params[:business])
      if @business.save
        redirect_to admin_businesses_path, :notice => "Business successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @business = Business.find(params[:id])
    end
    
    def update
      @business = Business.find(params[:id])
      if @business.update_attributes(params[:business])
        redirect_to admin_businesses_path, :notice => "Business successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @business = Business.find(params[:id])
      @business.destroy
      redirect_to admin_businesses_path, :notice => "Business destroyed."
    end
    
  end
end
