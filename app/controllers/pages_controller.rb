class PagesController < ApplicationController

  def show
    @page = Page.find(params[:id])
    @current_branch = @page.branch
    @meta_description = @page.meta_description
    if @page.style == "what_we_do_sub"
      if @page.title == 'We collaborate'
        @team_members = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Collaboration", true, true).order(:position).map{|x| x.name}
      elsif @page.title == 'We communicate'
        @team_members = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Communication", true, true).order(:position).map{|x| x.name}
      elsif @page.title == 'We promote'
        @team_members = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Promotion", true, true).order(:position).map{|x| x.name}
      elsif @page.title == 'We innovate'
        @team_members = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Innovation", true, true).order(:position).map{|x| x.name}
      end
    end
    @meta_tags = @page.meta_tags
    @business_highlight = BusinessHighlight.where(:display => true).order("date desc").first
    @project = @page.projects.where(:display => true).order("RAND()").first

    if @page.title == 'We collaborate'
      @partners = Partner.where(:display => true).order(:position).limit(8)
    end

    render :layout => @page.layout
  end

end
