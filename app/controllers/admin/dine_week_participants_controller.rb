module Admin
  class DineWeekParticipantsController < Manticore::ApplicationController
  
    def index
      @dine_week_participants = DineWeekParticipant.where(
        ["company_name LIKE :search OR email LIKE :search OR website LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "company_name").page(params[:page])
    end
    
    def new
      @dine_week_participant = DineWeekParticipant.new
    end
    
    def create
      @dine_week_participant = DineWeekParticipant.new(params[:dine_week_participant])
      if @dine_week_participant.save
        redirect_to admin_dine_week_participants_path, :notice => "Dine week participant successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @dine_week_participant = DineWeekParticipant.find(params[:id])
    end
    
    def update
      @dine_week_participant = DineWeekParticipant.find(params[:id])
      if @dine_week_participant.update_attributes(params[:dine_week_participant])
        redirect_to admin_dine_week_participants_path, :notice => "Dine week participant successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @dine_week_participant = DineWeekParticipant.find(params[:id])
      @dine_week_participant.destroy
      redirect_to admin_dine_week_participants_path, :notice => "Dine week participant destroyed."
    end
    
  end
end
