module Admin
  class ProjectsController < Manticore::ApplicationController
    
    helper :form
#    edit_images_for Project, [
#      [ :image_1, {:small => ['fill'], :shadowbox => ['fit', 640, 480]} ],
#      :image_2, 
#      [ :image_3, {:small => ['fill'], :shadowbox => ['fit', 640, 480]} ], 
#      :image_4, 
#      :image_5
#    ]
    
    crops_images_for Project, :image_1, {:small => 'fill', :shadowbox => {:fit => [640, 480]}}

    def index
      @projects = Project.joins(:page).where(
        ["pages.title LIKE :search OR projects.title LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "title").page(params[:page]).per(10)
    end
    
    def new
      @project = Project.new({:display => true})
    end
    
    def create
      @project = Project.new(params[:project])
      if @project.save
        redirect_to admin_projects_path, :notice => "Project successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @project = Project.find(params[:id])
    end
    
    def update
      @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
        redirect_to admin_projects_path, :notice => "Project successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to admin_projects_path, :notice => "Project destroyed."
    end
    
  end
end
