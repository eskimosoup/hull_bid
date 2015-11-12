module Admin
  class PagesController < Manticore::ApplicationController

    crops_images_for Page, :image, {
      :show => { :fit => [656, 1000] }, :show_small => { :fit => [440, 1000] } 
    }

    def index
      @pages = Page.where(
        ["title LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "title").page(params[:page]).per(10)
    end

    def new
      @page = Page.new
    end

    def edit
      @page = Page.find(params[:id])
    end

    def create
      @page = Page.new(params[:page])
      if @page.save
        redirect_to admin_pages_path, :notice => 'Page was successfully created.'
      else
        render :action => "new"
      end
    end

    def update
      @page = Page.find(params[:id])
      if @page.update_attributes(params[:page])
        redirect_to admin_pages_path, :notice => 'Page was successfully updated.'
      else
        render :action => "edit"
      end
    end

    def destroy
      @page = Page.find(params[:id])
      @page.destroy
      redirect_to admin_pages_path, :notice => 'Page was successfully destroyed.'
    end
    
  end
end
