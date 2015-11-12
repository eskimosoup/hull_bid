module Admin
  class PartnersController < Manticore::ApplicationController
  
    crops_images_for Partner, :logo, { :index => 'fill' }
    
    def index
      @partners = Partner.order(:position)
    end

    def new
      @partner = Partner.new
    end
    
    def create
      @partner = Partner.new(params[:partner])
      if @partner.save
        redirect_to admin_partners_path, :notice => "Partner successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @partner = Partner.find(params[:id])
    end
    
    def update
      @partner = Partner.find(params[:id])
      if @partner.update_attributes(params[:partner])
        redirect_to admin_partners_path, :notice => "Partner successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @partner = Partner.find(params[:id])
      @partner.destroy
      redirect_to admin_partners_path, :notice => "Partner destroyed."
    end
    
  end
end
