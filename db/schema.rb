# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20200514094631) do

  create_table "Sheet1", :id => false, :force => true do |t|
    t.string "name",           :limit => 46
    t.string "address_line_1", :limit => 31
    t.string "address_line_2", :limit => 25
    t.string "address_line_3", :limit => 16
    t.string "town",           :limit => 4
    t.string "postcode",       :limit => 7
    t.string "telephone",      :limit => 25
    t.string "website",        :limit => 30
    t.string "category",       :limit => 21
  end

  create_table "achievements", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "main_content"
    t.date     "date"
    t.boolean  "display",      :default => true
    t.string   "image"
    t.string   "image_alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "headline"
    t.text     "summary"
    t.text     "main_content"
    t.date     "date"
    t.boolean  "display",      :default => true
    t.string   "image"
    t.string   "image_alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "standalone",   :default => false
  end

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "image"
    t.integer  "position"
    t.boolean  "display",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_highlights", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "main_content"
    t.date     "date"
    t.boolean  "display",      :default => true
    t.string   "image_1"
    t.string   "image_1_alt"
    t.string   "image_2"
    t.string   "image_2_alt"
    t.string   "image_3"
    t.string   "image_3_alt"
    t.string   "image_4"
    t.string   "image_4_alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "town"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "email"
    t.string   "website"
    t.boolean  "display",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
    t.string   "logo_alt"
    t.string   "Category"
  end

  add_index "businesses", ["name"], :name => "name", :unique => true

  create_table "businesses_2017", :force => true do |t|
    t.string   "name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "town"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "email"
    t.string   "website"
    t.boolean  "display",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
    t.string   "logo_alt"
    t.string   "Category"
  end

  create_table "businesses_old", :force => true do |t|
    t.string   "name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "town"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "email"
    t.string   "website"
    t.boolean  "display",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
    t.string   "logo_alt"
  end

  create_table "chronicler_documents", :force => true do |t|
    t.string "name"
    t.string "document"
  end

  create_table "chronicler_images", :force => true do |t|
    t.string "name"
    t.string "image"
  end

  create_table "default_gallery_images", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.boolean  "display",    :default => true
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dine_week_participants", :force => true do |t|
    t.string   "company_name"
    t.text     "address"
    t.string   "city"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "email"
    t.string   "website"
    t.boolean  "bogof"
    t.boolean  "kids_eat_free"
    t.boolean  "display",             :default => true
    t.boolean  "ask_about_dine_week"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_items", :force => true do |t|
    t.integer "email_id"
    t.string  "email_item_type"
    t.integer "email_item_id"
    t.integer "position",        :default => 0
  end

  create_table "emails", :force => true do |t|
    t.string   "template"
    t.string   "subject"
    t.string   "heading"
    t.text     "summary"
    t.text     "content"
    t.string   "image"
    t.string   "image_alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_gallery_id"
    t.string   "campaign_id"
    t.boolean  "campaign_sent",    :default => false
    t.string   "list_id"
    t.string   "list_name"
  end

  create_table "event_galleries", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.text     "summary"
    t.boolean  "display",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "event_gallery_images", :force => true do |t|
    t.integer  "event_gallery_id"
    t.string   "image"
    t.string   "image_alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "display",          :default => true
  end

  create_table "events", :force => true do |t|
    t.string   "headline"
    t.text     "summary"
    t.text     "main_content"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "display",      :default => true
    t.string   "image"
    t.string   "image_alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.boolean  "display",    :default => true
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "footfall_data_entries", :force => true do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manticore_administrators", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_send_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "layout"
    t.string   "style"
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.text     "meta_description"
    t.text     "meta_tags"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tagline"
    t.integer  "team_member_id"
    t.text     "team_member_introduction"
    t.string   "team_member_heading"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "website"
    t.boolean  "display",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",   :default => 0
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "image_1"
    t.string   "caption_1"
    t.string   "image_2"
    t.string   "caption_2"
    t.string   "image_3"
    t.string   "caption_3"
    t.string   "image_4"
    t.string   "caption_4"
    t.string   "image_5"
    t.string   "caption_5"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "link"
    t.string   "document"
    t.string   "document_title"
    t.boolean  "display",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], :name => "taggings_idx", :unique => true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "taggings_2017", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings_2017", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings_2017", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "taggings_old", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings_old", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings_old", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "tags_old", :force => true do |t|
    t.string "name"
  end

  create_table "team_members", :force => true do |t|
    t.string   "name"
    t.string   "role"
    t.string   "employer"
    t.string   "email"
    t.string   "phone"
    t.boolean  "board_member"
    t.boolean  "display",      :default => true
    t.string   "image"
    t.string   "image_alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "mobile"
    t.string   "category"
    t.boolean  "chair"
    t.boolean  "vice_chair"
    t.boolean  "contact_page", :default => false
  end

  create_table "willow_branches", :force => true do |t|
    t.string  "tree"
    t.string  "name"
    t.integer "position",              :default => 0
    t.string  "ancestry"
    t.integer "ancestry_depth",        :default => 0
    t.string  "positions_depth_cache"
    t.integer "leaf_id"
    t.string  "leaf_type"
    t.string  "access_key"
    t.boolean "sturdy",                :default => false
    t.boolean "can_have_children",     :default => false
    t.boolean "primary",               :default => false
  end

  add_index "willow_branches", ["ancestry"], :name => "index_willow_branches_on_ancestry"

  create_table "willow_leaves", :force => true do |t|
    t.string "name"
    t.string "route"
    t.string "type"
  end

end
