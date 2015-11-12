class BusinessHighlightsController < ApplicationController

  def show
    @business_highlights = BusinessHighlight.where(["display = ? AND id != ?", true, params[:id].to_i]).order(:date)
    @business_highlight = BusinessHighlight.find(params[:id])
    @image_count = 0
    for i in 1..4
      unless @business_highlight.send("image_#{i}").show.blank?
        @image_count += 1 
      end
    end 
  end

end

