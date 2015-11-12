xml.instruct!

xml.rss :version => "2.0" do
	xml.channel do
		xml.title       "Hull BID News"
		xml.link        articles_url(:rss)
		Article.where(:display => true).order("date DESC").each do |article|
			xml.item do
				xml.title       article.headline
				xml.link        url_for :only_path => false, :controller => 'articles', :action => 'show', :id => article
				xml.description article.main_content
				xml.guid        url_for :only_path => false, :controller => 'articles', :action => 'show', :id => article
			end
		end
	end
end