class AchievementsController < ApplicationController

  def show
    @achievements = Achievement.where(["display = ? AND id != ?", true, params[:id].to_i]).order(:date)
    @achievement = Achievement.find(params[:id])
    @business_highlight = BusinessHighlight.where(:display => true).order("date desc").first
  end

end
