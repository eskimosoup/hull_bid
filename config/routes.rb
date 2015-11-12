HullBid2013::Application.routes.draw do

  namespace :admin do  end

  resources :achievements, :only => [:show]
  resources :articles, :only => [:index, :show]
  resources :businesses, :only => [:index]
  resources :business_highlights, :only => [:show]
  resources :contacts, :only => [:new, :create]
  resources :emails, :only => [:show]
  resources :events, :only => [:index, :show]
  resources :event_galleries, :only => [:index, :show]
  resources :faqs, :only => [:index]
  resources :newsletter_subscribers, :only => [:create]
  resources :pages, :only => [:show]
  resources :resources, :only => [:index]
  resources :team_members, :only => [:index]

  namespace :admin do
    manticore_resources :dine_week_participants
    manticore_resources :faqs
    manticore_resources :footfall_data_entries
    manticore_resources :project_images
    manticore_resources :resources
    manticore_resources :event_galleries do
      chronicler_resources :event_gallery_images
    end
    chronicler_resources :achievements
    chronicler_resources :articles
    chronicler_resources :banners
    chronicler_resources :businesses
    chronicler_resources :business_highlights
    chronicler_resources :default_gallery_images
    chronicler_resources :emails do
      post 'change_template', :on => :member
      post 'new_item', :on => :member
      post 'destroy_item', :on => :member
      post 'create_campaign', :on => :member
      post 'update_campaign', :on => :member
      post 'send_test', :on => :member
      post 'send_now', :on => :member
    end
    chronicler_resources :events
    chronicler_resources :pages
    chronicler_resources :partners
    chronicler_resources :projects
    chronicler_resources :team_members
  end

  match "/accessibility" => "application#accessibility"
  match "/site_map" => "application#site_map"
  match "/rss" => "application#rss"

  root :to => "application#index"

  mount Manticore::Engine => "/admin"

end
