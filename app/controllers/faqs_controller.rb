class FaqsController < ApplicationController

  def index
    @current_branch = Willow::StaticPage.find_by_name('FAQs').branch
    @faqs = Faq.where(:display => true).order(:position)
    @business_highlight = BusinessHighlight.where(:display => true).order(:date).first
  end

end

