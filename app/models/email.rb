class Email < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  has_many :email_items, :dependent => :destroy

  belongs_to :event_gallery

  accepts_nested_attributes_for :email_items

  mount_uploader :image, EmailImageUploader

  before_create :set_list_name

  validates :list_id, :presence => true

  def self.templates
    ['Newsletter', 'Solus']
  end

  def create_campaign
    api = Mailchimp::API.new('7459d7d519f57e3894a6ea3d8cbbd304-us7')

    # campaignCreate(string apikey, string type, array options, array content, array segment_opts, array type_opts)
    campaign_id = api.campaignCreate(
      'type' => 'regular',
      'options' => {
        'list_id' => list_id,
        'subject' => subject,
        'from_email' => 'info@hullbid.co.uk',
        'from_name' => 'HullBID',
        'to_name' => 'HullBID Newsletter Subscribers',
        'auto_footer' => true
       },
      'content' => {
        'url' => email_url(self, :host => ActionMailer::Base.default_url_options[:host])
      }
    )

    update_attribute(:campaign_id, campaign_id)
  end

  def update_campaign
    api = Mailchimp::API.new('7459d7d519f57e3894a6ea3d8cbbd304-us7')

    # campaignUpdate(string apikey, string cid, string name, mixed value)
    api.campaignUpdate('cid' => campaign_id, 'name' => 'subject', 'value' => subject)
    api.campaignUpdate(
      'cid' => campaign_id,
      'name' => 'content',
      'value' => { 'url' => email_url(self, :host => ActionMailer::Base.default_url_options[:host]) }
    )
  end

  def send_test
    api = Mailchimp::API.new('7459d7d519f57e3894a6ea3d8cbbd304-us7')

    # campaignSendTest(string apikey, string cid, array test_emails, string send_type)
    api.campaignSendTest('cid' => campaign_id, 'test_emails' => [SITE_SETTINGS['Email']], 'send_type' => 'html')
  end

  def send_now
    api = Mailchimp::API.new('7459d7d519f57e3894a6ea3d8cbbd304-us7')

    # campaignSendNow(string apikey, string cid)
    if api.campaignSendNow('cid' => campaign_id)
      update_attribute(:campaign_sent, true)
    end
  end

  def set_list_name
    self.list_name = Email.campaigns.rassoc("#{list_id}").first
  end

  def self.campaigns
    api = Mailchimp::API.new('7459d7d519f57e3894a6ea3d8cbbd304-us7')

    list = api.lists
    unless list.blank? or list["data"].blank?
      campaigns = list["data"].map{|x| x.values_at("name", "id")}
    end
  end

end
