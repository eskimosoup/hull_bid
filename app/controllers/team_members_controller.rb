class TeamMembersController < ApplicationController

  def index
    @current_branch = Willow::StaticPage.find_by_name('Team Members').branch
    @page = Page.where(:title => "Meet the Board").first
    @chair = TeamMember.where("chair = ? AND board_member = ? AND display = ?", true, true, true).order(:position)
    @communicators = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Communication", true, true).order(:position).reject{|x| x.chair == true}
    @collaborators = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Collaboration", true, true).order(:position).reject{|x| x.chair == true}
    @promoters = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Promotion", true, true).order(:position).reject{|x| x.chair == true}
    @innovators = TeamMember.where("category = ? AND board_member = ? AND display = ?", "Innovation", true, true).order(:position).reject{|x| x.chair == true}  
  end

end

