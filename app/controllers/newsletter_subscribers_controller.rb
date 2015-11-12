class NewsletterSubscribersController < ApplicationController

	def create
		@subscriber = NewsletterSubscriber.new(params[:newsletter_subscriber])
		if @subscriber.valid?
      NewsletterSubscriberMailer.new(@subscriber).deliver
      redirect_to SITE_SETTINGS["Newsletter Subscription Page"]
    else
      redirect_to root_path, :notice => "Please try again, there was a problem"
    end
	end
		
end
