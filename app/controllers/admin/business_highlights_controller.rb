module Admin
  class BusinessHighlightsController < Manticore::ApplicationController

    edit_images_for BusinessHighlight, [[:image_1, { :show => ["fill", 440, 290], :home => ["fill", 132, 198], :index => ["fill", 132, 132] }],
                                        [:image_2, { :show => ["fill", 440, 290], :home => ["fill", 132, 198], :index => ["fill", 132, 132] }],
                                        [:image_3, { :show => ["fill", 440, 290], :home => ["fill", 132, 198], :index => ["fill", 132, 132] }],
                                        [:image_4, { :show => ["fill", 440, 290], :home => ["fill", 132, 198], :index => ["fill", 132, 132] }]
                                        ]

    def index
      @business_highlights = BusinessHighlight.where(
        ["name LIKE :search OR summary LIKE :search", {:search => "%#{params[:search]}%"}]
      ).order(params[:order] ||= "date DESC").page(params[:page]).per(10)
    end

    def new
      @business_highlight = BusinessHighlight.new
    end

    def create
      @business_highlight = BusinessHighlight.new(params[:business_highlight])
      if @business_highlight.save
        redirect_to admin_business_highlights_path, :notice => "Business highlight successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @business_highlight = BusinessHighlight.find(params[:id])
    end

    def update
      @business_highlight = BusinessHighlight.find(params[:id])
      if @business_highlight.update_attributes(params[:business_highlight])
        redirect_to admin_business_highlights_path, :notice => "Business highlight successfully updated."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @business_highlight = BusinessHighlight.find(params[:id])
      @business_highlight.destroy
      redirect_to admin_business_highlights_path, :notice => "Business highlight destroyed."
    end

  end
end
