class BusinessesController < ApplicationController

  def index
		@current_branch = Willow::Branch.find_by_name('Business Directory')
    if params[:category]
      @businesses = Business.where(:display => true).order(:name).tagged_with(params[:category]).page(params[:page]).per(10)
    elsif params[:search]
      names = Business.where("display = ? AND name LIKE ?", true, "%#{params[:search]}%")
      categories = Business.where(:display => true).tagged_with(params[:search])
      results = names + categories
      @businesses = Kaminari.paginate_array(results).page(params[:page]).per(10)
    else
      @businesses = Business.where(:display => true)
      @business_categories = @businesses.map{|x| x.categories}.flatten.uniq.sort_by{|x| x.name}
    end

    @business_highlight = BusinessHighlight.where(:display => true).order(:date).first
  end

end

