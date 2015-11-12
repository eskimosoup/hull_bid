module Admin
  class FootfallDataEntriesController < Manticore::ApplicationController
  
    def index
      @footfall_data_entries = FootfallDataEntry.where(
        ["year LIKE :search OR month LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "year desc, month desc").page(params[:page])
    end
    
    def new
      @footfall_data_entry = FootfallDataEntry.new
    end
    
    def create
      @footfall_data_entry = FootfallDataEntry.new(params[:footfall_data_entry])
      if @footfall_data_entry.save
        redirect_to admin_footfall_data_entries_path, :notice => "Footfall data entry successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @footfall_data_entry = FootfallDataEntry.find(params[:id])
    end
    
    def update
      @footfall_data_entry = FootfallDataEntry.find(params[:id])
      if @footfall_data_entry.update_attributes(params[:footfall_data_entry])
        redirect_to admin_footfall_data_entries_path, :notice => "Footfall data entry successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @footfall_data_entry = FootfallDataEntry.find(params[:id])
      @footfall_data_entry.destroy
      redirect_to admin_footfall_data_entries_path, :notice => "Footfall data entry destroyed."
    end
    
  end
end
