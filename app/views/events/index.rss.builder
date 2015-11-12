xml.instruct!

xml.rss :version => "2.0" do
	xml.channel do
		xml.title       "Hull BID Events"
		xml.link        events_url(:rss)
		Event.where(:display => true).order("start_date DESC").each do |event|
			xml.item do
				xml.title       event.headline
				xml.link        url_for :only_path => false, :controller => 'events', :action => 'show', :id => event
				xml.description event.main_content
				xml.guid        url_for :only_path => false, :controller => 'events', :action => 'show', :id => event
			end
		end
	end
end