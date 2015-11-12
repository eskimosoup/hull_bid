class NewsletterSubscriberMailer < ActionMailer::Base
  default :from => SITE_SETTINGS["Email"]
  default :to => SITE_SETTINGS["Email"]
  
  def new(subscriber)
    @subscriber = subscriber
    mail :subject => "Newsletter Subscriber form completed - #{SITE_SETTINGS['Name']}"
  end  
  
end