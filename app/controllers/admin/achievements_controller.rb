module Admin
  class AchievementsController < Manticore::ApplicationController

    helper :form
    crops_images_for Achievement, :image, { :show => { :fit => [440, 1000] } }

    def index
      @achievements = Achievement.where(
        ["name LIKE :search OR summary LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "date DESC").page(params[:page]).per(10)
    end
    
    def new
      @achievement = Achievement.new
    end
    
    def create
      @achievement = Achievement.new(params[:achievement])
      if @achievement.save
        redirect_to admin_achievements_path, :notice => "Achievement successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @achievement = Achievement.find(params[:id])
    end
    
    def update
      @achievement = Achievement.find(params[:id])
      if @achievement.update_attributes(params[:achievement])
        redirect_to admin_achievements_path, :notice => "Achievement successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @achievement = Achievement.find(params[:id])
      @achievement.destroy
      redirect_to admin_achievements_path, :notice => "Achievement destroyed."
    end
    
  end
end
