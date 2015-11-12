module Admin
  class FaqsController < Manticore::ApplicationController

    helper :form

    def index
      @faqs = Faq.order(:position)
    end
    
    def new
      @faq = Faq.new
    end
    
    def create
      @faq = Faq.new(params[:faq])
      if @faq.save
        redirect_to admin_faqs_path, :notice => "Faq successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @faq = Faq.find(params[:id])
    end
    
    def update
      @faq = Faq.find(params[:id])
      if @faq.update_attributes(params[:faq])
        redirect_to admin_faqs_path, :notice => "Faq successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @faq = Faq.find(params[:id])
      @faq.destroy
      redirect_to admin_faqs_path, :notice => "Faq destroyed."
    end
    
  end
end
