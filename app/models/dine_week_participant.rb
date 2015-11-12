class DineWeekParticipant < ActiveRecord::Base
  validates :company_name, :presence => true
end
