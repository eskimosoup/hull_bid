class FootfallDataEntry < ActiveRecord::Base
  
  validates :year, :month, :count, :presence => true
  validates :count, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :month, :uniqueness => { :scope => :year,
    :message => "should happen once per year" }  
  
  scope :for_year_and_month, lambda{|year, month| {:conditions => ["year = ? AND month = ?", year, month]}}

  #Example output for google maps
  #['Month', 'Nov', 'Dec', 'Jan'], ['2013', 0, 0, 2728088], ['2014', 0, 0, 3369033], ['2015', 0, 0, 0]

  def self.months_wanted
    [3,2,1].map{|x| Date.today.months_ago(x).month }
  end

  def self.years_wanted
    #always use last month's year as if in january you want oct, nov, dec of last year and previous two years
    #if in february then you want this january's data
    date = Date.today.months_ago(1)
    [2,1,0].map{|x| date.years_ago(x).year}
  end

  def self.data
    data = []
    legend = FootfallDataEntry.months_wanted.map{|x| Date::ABBR_MONTHNAMES[x]}.unshift('Month')
    data << legend
    FootfallDataEntry.years_wanted.each do |year|
      footfall_data_entries = FootfallDataEntry.where("year = ? AND month in (?)", year, FootfallDataEntry.months_wanted)
      year_array = [year.to_s]
      #Has to be to_s otherwise google charts thinks it's a number not a year
      FootfallDataEntry.months_wanted.each do |month|
        #get first matching month from active record collection (should only be one) and get the count, try will return nil if it's a nil object
        year_array << footfall_data_entries.select{|x| x.month == month }.first.try(:count)
      end
      data << year_array
    end
    data
  end
end