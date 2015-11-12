module Admin
  class DefaultGalleryImagesController < Manticore::ApplicationController

    edit_images_for DefaultGalleryImage, [[:image, { :show => ["fill", 437, 176] }]]

    def index
      @default_gallery_images = DefaultGalleryImage.order(:position)
    end

    def new
      @default_gallery_image = DefaultGalleryImage.new
    end

    def create
      @default_gallery_image = DefaultGalleryImage.new(params[:default_gallery_image])
      if @default_gallery_image.save
        redirect_to admin_default_gallery_images_path, :notice => "Default gallery image successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @default_gallery_image = DefaultGalleryImage.find(params[:id])
    end

    def update
      @default_gallery_image = DefaultGalleryImage.find(params[:id])
      if @default_gallery_image.update_attributes(params[:default_gallery_image])
        redirect_to admin_default_gallery_images_path, :notice => "Default gallery image successfully updated."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @default_gallery_image = DefaultGalleryImage.find(params[:id])
      @default_gallery_image.destroy
      redirect_to admin_default_gallery_images_path, :notice => "Default gallery image destroyed."
    end

  end
end
