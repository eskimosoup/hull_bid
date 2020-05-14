class ArticlesController < ApplicationController

  def index
		@current_branch = Willow::Branch.find_by_name('News')
		params[:page] ||= 1
  	if params[:category]
  	  @title = "#{params[:category]} News"
      search = Article.where(:display => true, :standalone => false).tagged_with(params[:category].to_s, :on => "categories")
    elsif params[:year] && params[:month]
      @title = "#{Date::MONTHNAMES[params[:month].to_i]} #{params[:year]} News"
      search = Article.where(:display => true, :standalone => false).year(params[:year]).month(params[:month])
    elsif params[:year]
      @title = "#{params[:year]} News"
    	search = Article.where(:display => true, :standalone => false).year(params[:year])
    else
      @title = "Latest News"
  		search = Article.where(:display => true, :standalone => false)
    end
    @articles = search.order("date DESC").page(params[:page]).per(10)
    @business_highlight = BusinessHighlight.where(:display => true).order("date desc").first
  end

  def show
    @current_branch = Willow::Branch.find_by_name('News')
    @article = Article.where(:display => true, :standalone => false).find(params[:id])
    @business_highlight = BusinessHighlight.where(:display => true).order("date desc").first
  end

end
