class ResourcesController < ApplicationController

  def index
		@current_branch = Willow::Branch.find_by_name('Resources')
    if params[:category]
			unless params[:category] == "Footfall"
				@resources = Resource.where(:display => true).order('created_at DESC').tagged_with(params[:category])
			end
      @title = params[:category]
    else
			@page = Page.where(:title => "Resources").first
			@title = "Resources"
    end
    @resource_categories = Tag.joins(:taggings).where(:taggings => {:taggable_type => 'Resource'}).uniq
    @business_highlight = BusinessHighlight.where(:display => true).order(:date).first
  end
end

