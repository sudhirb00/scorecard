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

ActiveRecord::Schema.define(:version => 0) do

  create_table "author_content_report", :force => true do |t|
    t.string  "author_id",    :limit => 200, :null => false
    t.string  "content_type", :limit => 200, :null => false
    t.integer "content_id",                  :null => false
    t.string  "action",       :limit => 2,   :null => false
    t.string  "status",       :limit => 2,   :null => false
  end

  create_table "citymaster", :primary_key => "iCityId", :force => true do |t|
    t.string   "cCityName",       :null => false
    t.integer  "iCityParentId",   :null => false
    t.integer  "iStateId",        :null => false
    t.datetime "dInsertDatetime", :null => false
    t.integer  "iStatus",         :null => false
  end

  create_table "config_variables", :primary_key => "variable_name", :force => true do |t|
    t.integer "value"
    t.text    "data"
  end

  create_table "est_hotsearch", :force => true do |t|
    t.integer  "user_id",             :limit => 8,   :default => 0,  :null => false
    t.string   "est_name"
    t.integer  "est_which_type_id",   :limit => 1,   :default => 0
    t.string   "est_which_type_name", :limit => 20
    t.integer  "viewcount",           :limit => 8,   :default => 0
    t.integer  "est_found_flag",      :limit => 1,   :default => 0
    t.datetime "insertdate"
    t.string   "guid",                :limit => 500
    t.integer  "est_city_id"
    t.string   "bylocation",          :limit => 100, :default => ""
  end

  create_table "est_hotsearches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estpriority", :force => true do |t|
    t.integer "city_id"
    t.integer "zone_id"
    t.integer "loc_id"
    t.integer "est_id",   :limit => 8
    t.string  "category"
    t.integer "priority",              :default => 0
    t.boolean "status",                :default => true
  end

  create_table "estviewcount", :primary_key => "vCntId", :force => true do |t|
    t.integer "vCntEstId",   :limit => 8,                :null => false
    t.string  "vCntBrowser"
    t.integer "vCount",      :limit => 8, :default => 0, :null => false
    t.date    "vCntInsDay",                              :null => false
  end

  create_table "grids", :force => true do |t|
    t.string  "grids_id", :limit => 20,                 :null => false
    t.string  "location",                               :null => false
    t.string  "alias",                                  :null => false
    t.string  "landmark", :limit => 500,                :null => false
    t.integer "status",                  :default => 1, :null => false
    t.integer "city_id",                                :null => false
  end

  create_table "ip_to_city_mapping", :force => true do |t|
    t.integer "locID",                     :null => false
    t.string  "country",    :limit => 20,  :null => false
    t.integer "regionId",                  :null => false
    t.string  "city_name",  :limit => 200, :null => false
    t.string  "postalCode", :limit => 100, :null => false
    t.string  "latitude",   :limit => 100, :null => false
    t.string  "longitude",  :limit => 100, :null => false
    t.string  "metrocode",  :limit => 100, :null => false
    t.string  "areacode",   :limit => 100, :null => false
  end

  create_table "ip_to_location_mapping", :force => true do |t|
    t.integer "startIpNum", :limit => 8, :null => false
    t.integer "endIpNum",   :limit => 8, :null => false
    t.integer "locID",                   :null => false
  end

  create_table "languagemaster", :primary_key => "iLaunguageID", :force => true do |t|
    t.string   "cLanguageName",                 :null => false
    t.string   "cLanguageCode",   :limit => 50, :null => false
    t.datetime "dInsertDatetime",               :null => false
    t.integer  "iStatus",                       :null => false
  end

  create_table "log_access", :id => false, :force => true do |t|
    t.integer   "entity_id"
    t.string    "entity_type", :limit => 20
    t.string    "user_agent"
    t.string    "ip",          :limit => 50
    t.string    "referer"
    t.string    "session_id",  :limit => 50
    t.string    "city",        :limit => 100
    t.timestamp "log_time",                   :null => false
  end

  create_table "mapmyindia_poi", :force => true do |t|
    t.string  "un_id",  :limit => 100, :null => false
    t.integer "est_id",                :null => false
    t.string  "poi_id",                :null => false
  end

  create_table "mcp_calls", :force => true do |t|
    t.string   "cdrid",                  :limit => 50,  :null => false
    t.integer  "caller",                                :null => false
    t.integer  "dnis",                                  :null => false
    t.string   "operator",               :limit => 50,  :null => false
    t.string   "circle",                 :limit => 50,  :null => false
    t.string   "languages",              :limit => 50,  :null => false
    t.integer  "called_to",              :limit => 8,   :null => false
    t.datetime "call_start_time",                       :null => false
    t.datetime "call_patch_starttime",                  :null => false
    t.datetime "connect_time",                          :null => false
    t.datetime "call_end_time",                         :null => false
    t.integer  "call_status",            :limit => 1,   :null => false
    t.string   "conf_status",            :limit => 10,  :null => false
    t.integer  "no_of_retry",                           :null => false
    t.integer  "callduration",                          :null => false
    t.integer  "conf_duration",                         :null => false
    t.integer  "did_duration",                          :null => false
    t.integer  "marchant_id",                           :null => false
    t.integer  "switching_handle",                      :null => false
    t.integer  "outcallfunc_returncode",                :null => false
    t.integer  "smsalert",               :limit => 1,   :null => false
    t.integer  "emailalert",             :limit => 1,   :null => false
    t.string   "recordfile",             :limit => 100, :null => false
    t.integer  "outcallfunc_isdnreason",                :null => false
    t.integer  "rec_flag",               :limit => 1,   :null => false
    t.integer  "vmn",                    :limit => 8
    t.integer  "orders"
    t.integer  "amount"
    t.text     "comments"
    t.integer  "est_id"
  end

  create_table "mishti_entry", :force => true do |t|
    t.string   "mishti_outletname", :limit => 200, :null => false
    t.text     "mishti_location",                  :null => false
    t.integer  "mishti_category",                  :null => false
    t.string   "readersname",       :limit => 200, :null => false
    t.string   "email",             :limit => 200, :null => false
    t.string   "mobile",            :limit => 20,  :null => false
    t.string   "ip",                :limit => 20,  :null => false
    t.datetime "insertdate",                       :null => false
    t.integer  "status",            :limit => 1,   :null => false
  end

  create_table "moviemaster", :primary_key => "iMovieId", :force => true do |t|
    t.string   "cMovieName",                       :null => false
    t.text     "cCast",             :limit => 255, :null => false
    t.text     "cSynopsis",                        :null => false
    t.string   "cImage",                           :null => false
    t.integer  "iLaunguageID",                     :null => false
    t.string   "cParentalGuidance", :limit => 5
    t.string   "iStarRating",       :limit => 20,  :null => false
    t.datetime "dReleaseDate",                     :null => false
    t.datetime "dInsertDatetime",                  :null => false
    t.integer  "iStatus",                          :null => false
  end

  create_table "movietheatermap", :primary_key => "iMtmId", :force => true do |t|
    t.integer  "iMovieId",        :limit => 8,                  :null => false
    t.integer  "iTheaterId",      :limit => 8,                  :null => false
    t.integer  "iLaunguageID",                                  :null => false
    t.integer  "iCityId",                                       :null => false
    t.datetime "dStartDatetime",                                :null => false
    t.datetime "dEndDatetime",                                  :null => false
    t.text     "cShowTime",       :limit => 255,                :null => false
    t.datetime "dInsertDatetime",                               :null => false
    t.integer  "tc_cityid",                      :default => 0, :null => false
    t.integer  "iStatus",                                       :null => false
  end

  create_table "new_virtual_numbers", :id => false, :force => true do |t|
    t.string "Est_ID",         :limit => 6
    t.string "New_Virtual_No", :limit => 18
    t.string "Old_Virtual_No", :limit => 18
  end

  create_table "pav_wow_contest", :force => true do |t|
    t.string   "vadapavjoin",            :limit => 200,                       :null => false
    t.string   "areavadapavjoin",        :limit => 200
    t.string   "reviewvadapavjoin",      :limit => 400
    t.string   "pavbhajijoin",           :limit => 200,                       :null => false
    t.string   "areapavbhajijoin",       :limit => 200
    t.string   "reviewpavbhajijoin",     :limit => 400
    t.string   "username",               :limit => 200,                       :null => false
    t.integer  "userid",                                                      :null => false
    t.string   "email",                  :limit => 200,                       :null => false
    t.string   "mobile",                 :limit => 20,                        :null => false
    t.integer  "contest_flag",           :limit => 1,                         :null => false
    t.integer  "contest_category",                                            :null => false
    t.string   "ip",                     :limit => 20,                        :null => false
    t.datetime "insertdate",                                                  :null => false
    t.integer  "status",                 :limit => 1,                         :null => false
    t.string   "contest_for_which_city", :limit => 200, :default => "Mumbai"
  end

  create_table "people_award_vote", :primary_key => "vote_id", :force => true do |t|
    t.integer  "awd_est_id",     :limit => 8,                     :null => false
    t.integer  "awd_org_est_id", :limit => 8,   :default => 0
    t.string   "awd_est_url",    :limit => 500
    t.string   "awd_est_name"
    t.integer  "awd_cat_id"
    t.string   "awd_cat_name"
    t.integer  "awd_city_id",                                     :null => false
    t.integer  "awd_user_id",    :limit => 8,                     :null => false
    t.string   "awd_user_name"
    t.boolean  "awd_type_id",                   :default => true, :null => false
    t.string   "awd_cat_est_id",                :default => "0"
    t.string   "awd_zone_name"
    t.datetime "uniquedate"
    t.datetime "insertdate"
    t.string   "ip",             :limit => 16
  end

  add_index "people_award_vote", ["awd_type_id", "awd_city_id", "awd_cat_id", "awd_user_id"], :name => "pwv_main"

  create_table "source", :force => true do |t|
    t.string   "name",    :limit => 200, :null => false
    t.datetime "created",                :null => false
    t.integer  "status",  :limit => 1,   :null => false
  end

  create_table "tc_admin_action_log", :primary_key => "ID", :force => true do |t|
    t.integer  "AUTHOR_ID",  :limit => 8,        :null => false
    t.string   "NAME",                           :null => false
    t.string   "MODULENAME", :limit => 50
    t.string   "HEADLINE"
    t.string   "IP",                             :null => false
    t.string   "URL",                            :null => false
    t.datetime "INSERTDATE",                     :null => false
    t.text     "QUERY",      :limit => 16777215, :null => false
    t.string   "FLAG",       :limit => 2,        :null => false
  end

  create_table "tc_advertiser_comments", :primary_key => "adc_id", :force => true do |t|
    t.integer  "adc_listing_id",                              :null => false
    t.string   "adc_order_id",   :limit => 50,                :null => false
    t.string   "adc_name",       :limit => 50,                :null => false
    t.text     "adc_comment",                                 :null => false
    t.string   "adc_email",      :limit => 50,                :null => false
    t.string   "adc_mobile",     :limit => 15,                :null => false
    t.datetime "insertdate",                                  :null => false
    t.integer  "status",         :limit => 1,  :default => 1, :null => false
    t.string   "IP",             :limit => 30,                :null => false
  end

  create_table "tc_advertiser_feedback", :primary_key => "ad_id", :force => true do |t|
    t.string   "ad_listing_title",    :limit => 100,                :null => false
    t.string   "ad_listing_category", :limit => 50,                 :null => false
    t.text     "ad_desc_text",                                      :null => false
    t.string   "ad_email",            :limit => 50,                 :null => false
    t.string   "ad_respond_email",    :limit => 50,                 :null => false
    t.string   "ad_name",             :limit => 50,                 :null => false
    t.string   "ad_contact",          :limit => 15,                 :null => false
    t.integer  "ad_istouch",          :limit => 1,   :default => 0, :null => false
    t.datetime "insertdate",                                        :null => false
    t.integer  "status",              :limit => 1,   :default => 1, :null => false
    t.string   "IP",                  :limit => 30,                 :null => false
  end

  create_table "tc_agree", :primary_key => "agree_id", :force => true do |t|
    t.integer  "agree_user_id",   :limit => 8,                 :null => false
    t.string   "agree_user_name",                              :null => false
    t.integer  "agree_est_id",    :limit => 8,                 :null => false
    t.integer  "agree_rev_id",    :limit => 8,                 :null => false
    t.string   "agree_type",      :limit => 9,                 :null => false
    t.datetime "insertdate",                                   :null => false
    t.string   "status",          :limit => 7,                 :null => false
    t.integer  "flag",            :limit => 1,  :default => 1, :null => false
    t.string   "IP",              :limit => 20,                :null => false
  end

  add_index "tc_agree", ["agree_est_id"], :name => "agree_est_id"
  add_index "tc_agree", ["agree_rev_id"], :name => "agree_rev_id"

  create_table "tc_author_master", :primary_key => "author_id", :force => true do |t|
    t.string   "author_name",          :limit => 50,                    :null => false
    t.string   "author_email",         :limit => 50,                    :null => false
    t.string   "author_username",      :limit => 50,                    :null => false
    t.string   "author_password",      :limit => 50,                    :null => false
    t.string   "author_rights",        :limit => 11,                    :null => false
    t.string   "author_thumbnail",                                      :null => false
    t.string   "author_blogger",       :limit => 3,                     :null => false
    t.string   "author_expert",        :limit => 3,                     :null => false
    t.string   "METATITLE"
    t.string   "METAKEYWORD"
    t.string   "METADESCRIPTION"
    t.integer  "est_id",               :limit => 8,   :default => 0,    :null => false
    t.string   "author_twitterhandle",                                  :null => false
    t.string   "author_facebookurl",   :limit => 500
    t.boolean  "author_status",                                         :null => false
    t.datetime "author_insertdate",                                     :null => false
    t.datetime "author_lastvisit",                                      :null => false
    t.string   "author_cmsmodules_id", :limit => 500
    t.string   "author_mobileno",      :limit => 15
    t.integer  "author_verifier_id",                                    :null => false
    t.integer  "movie_cityid",                        :default => 0,    :null => false
    t.date     "pwd_changed_date",                                      :null => false
    t.string   "is_locked",            :limit => 3,   :default => "No", :null => false
  end

  add_index "tc_author_master", ["author_name"], :name => "name"
  add_index "tc_author_master", ["author_status"], :name => "status"
  add_index "tc_author_master", ["author_username"], :name => "username", :unique => true

  create_table "tc_author_master_new", :primary_key => "ID", :force => true do |t|
    t.string   "NAME",            :limit => 50,                     :null => false
    t.string   "EMAIL",           :limit => 50,                     :null => false
    t.string   "mobileno",        :limit => 100, :default => "0"
    t.string   "USERNAME",        :limit => 50,                     :null => false
    t.string   "PASSWORD",        :limit => 50,                     :null => false
    t.string   "RIGHTS",          :limit => 11,                     :null => false
    t.string   "THUMBNAIL",                                         :null => false
    t.string   "BLOGGER",         :limit => 3,                      :null => false
    t.string   "EXPERT",          :limit => 3,                      :null => false
    t.string   "METATITLE"
    t.string   "METAKEYWORD"
    t.string   "METADESCRIPTION"
    t.integer  "est_id",          :limit => 8,   :default => 0,     :null => false
    t.string   "TWITTERHANDLE",                                     :null => false
    t.string   "FACEBOOKURL",     :limit => 500
    t.boolean  "STATUS",                                            :null => false
    t.datetime "INSERTDATE",                                        :null => false
    t.datetime "LASTVISIT",                                         :null => false
    t.string   "CMSMODULES_ID",   :limit => 500
    t.string   "SECTION_ID",      :limit => 500
    t.boolean  "IS_FG",                          :default => false, :null => false
  end

  add_index "tc_author_master_new", ["NAME"], :name => "name"
  add_index "tc_author_master_new", ["STATUS"], :name => "status"
  add_index "tc_author_master_new", ["USERNAME"], :name => "username", :unique => true

  create_table "tc_awards_category", :primary_key => "cat_id", :force => true do |t|
    t.string   "cat_name",                                      :null => false
    t.integer  "cat_awa_m_id",                                  :null => false
    t.integer  "cat_city_id",                :default => 0
    t.datetime "insertdate",                                    :null => false
    t.integer  "status",       :limit => 1,                     :null => false
    t.string   "IP",           :limit => 20,                    :null => false
    t.boolean  "is_fg",                      :default => false, :null => false
  end

  create_table "tc_awards_contest", :primary_key => "awc_id", :force => true do |t|
    t.integer  "awc_master_id",                  :null => false
    t.integer  "awc_category_id",                :null => false
    t.integer  "awc_city",                       :null => false
    t.string   "awc_est_name",    :limit => 150, :null => false
    t.string   "awc_est_address",                :null => false
    t.boolean  "status",                         :null => false
    t.string   "IP",              :limit => 20,  :null => false
    t.datetime "insertdate",                     :null => false
  end

  create_table "tc_awards_details", :primary_key => "awards_id", :force => true do |t|
    t.integer  "award_main_cat",                   :null => false
    t.integer  "award_sub_cat",                    :null => false
    t.integer  "award_city_id",     :limit => 1,   :null => false
    t.string   "award_est_name",    :limit => 100, :null => false
    t.text     "award_est_address",                :null => false
    t.text     "award_est_url",                    :null => false
    t.string   "IP",                :limit => 30,  :null => false
    t.datetime "insertdate",                       :null => false
    t.integer  "status",            :limit => 1,   :null => false
  end

  create_table "tc_awards_gallery", :force => true do |t|
    t.integer  "city_id",                                       :null => false
    t.string   "year",        :limit => 4,                      :null => false
    t.boolean  "status",                     :default => false, :null => false
    t.string   "image_url",   :limit => 200,                    :null => false
    t.datetime "insertdate",                                    :null => false
    t.integer  "added_by",                                      :null => false
    t.datetime "lastupdate",                                    :null => false
    t.integer  "updated_by",                                    :null => false
    t.text     "image_title", :limit => 255
    t.integer  "listorder"
  end

  add_index "tc_awards_gallery", ["year"], :name => "aw_year_main"

  create_table "tc_awards_main", :primary_key => "awa_id", :force => true do |t|
    t.integer  "awards_est_id",        :limit => 8,                      :null => false
    t.boolean  "awards_est_whichtype",                :default => false
    t.integer  "awards_name_year_id",                                    :null => false
    t.integer  "awards_category_id",                                     :null => false
    t.integer  "awards_vote_cnt",      :limit => 8,   :default => 0
    t.datetime "insertdate",                                             :null => false
    t.integer  "status",               :limit => 1,                      :null => false
    t.integer  "is_awarded",           :limit => 2,   :default => 1,     :null => false
    t.integer  "cityID",                              :default => 0,     :null => false
    t.integer  "created_by",                          :default => 0,     :null => false
    t.integer  "est_zone_id",                         :default => 0
    t.integer  "est_loc_id",                          :default => 0
    t.string   "ip",                   :limit => 100,                    :null => false
  end

  create_table "tc_awards_master", :primary_key => "mas_id", :force => true do |t|
    t.string   "mas_name",                                    :null => false
    t.string   "mas_year",   :limit => 20,                    :null => false
    t.string   "mas_logo",                                    :null => false
    t.datetime "insertdate",                                  :null => false
    t.integer  "status",     :limit => 1,                     :null => false
    t.string   "IP",         :limit => 20,                    :null => false
    t.boolean  "is_fg",                    :default => false, :null => false
  end

  create_table "tc_awrads_vote", :primary_key => "vote_id", :force => true do |t|
    t.integer  "est_id",          :limit => 8
    t.string   "est_name"
    t.integer  "user_id",         :limit => 8
    t.string   "user_name"
    t.integer  "awd_master_id",   :limit => 8
    t.string   "awd_master_name"
    t.integer  "awd_id",          :limit => 8
    t.integer  "awd_catid",       :limit => 8
    t.string   "awd_catname"
    t.string   "awd_typeflag"
    t.datetime "insertdate"
    t.integer  "status",          :limit => 1
    t.string   "ip"
    t.string   "mobile",          :limit => 200
    t.string   "email",           :limit => 200
  end

  create_table "tc_banner", :force => true do |t|
    t.integer  "banner_city_id"
    t.boolean  "banner_loc",        :default => true
    t.boolean  "banner_position",   :default => true
    t.string   "banner_image"
    t.string   "banner_title"
    t.string   "banner_url"
    t.text     "banner_jscode"
    t.boolean  "banner_targetloc",  :default => true
    t.boolean  "banner_isalltime",  :default => true
    t.datetime "banner_startdate"
    t.datetime "banner_enddate"
    t.datetime "banner_insertdate"
    t.boolean  "status",            :default => true
  end

  add_index "tc_banner", ["status", "banner_city_id"], :name => "ind_sta_city"

  create_table "tc_brands", :force => true do |t|
    t.string   "name",                                       :null => false
    t.string   "image"
    t.integer  "p_id",                     :default => 0,    :null => false
    t.datetime "insertdate"
    t.string   "ip",         :limit => 20
    t.boolean  "status",                   :default => true, :null => false
  end

  create_table "tc_camp", :primary_key => "slug_id", :force => true do |t|
    t.integer  "slug_city_id",      :limit => 8,                    :null => false
    t.integer  "slug_zone_id",                                      :null => false
    t.integer  "slug_locality_id",                                  :null => false
    t.integer  "slug_est_id",       :limit => 8,                    :null => false
    t.string   "slug_image",                                        :null => false
    t.string   "slug_text",                                         :null => false
    t.string   "slug_url",                                          :null => false
    t.boolean  "slug_index",                     :default => false, :null => false
    t.boolean  "slug_rest_section",              :default => false, :null => false
    t.boolean  "slug_bar_section",               :default => false, :null => false
    t.boolean  "slug_serach",                    :default => false, :null => false
    t.boolean  "slug_event",                     :default => false, :null => false
    t.datetime "slug_startdate",                                    :null => false
    t.datetime "slug_enddate",                                      :null => false
    t.integer  "slug_imgcnt",                    :default => 0,     :null => false
    t.integer  "slug_textcnt",                   :default => 0,     :null => false
    t.datetime "insertdate",                                        :null => false
    t.integer  "is_featured",       :limit => 1
    t.integer  "priority"
    t.boolean  "status",                         :default => true,  :null => false
  end

  create_table "tc_chef", :primary_key => "chef_id", :force => true do |t|
    t.integer  "chef_est_id",  :limit => 8,        :null => false
    t.string   "chef_name",                        :null => false
    t.text     "chef_profile", :limit => 16777215, :null => false
    t.string   "chef_image",                       :null => false
    t.integer  "chef_status",  :limit => 1,        :null => false
    t.datetime "insert_date",                      :null => false
  end

  create_table "tc_city", :primary_key => "city_id", :force => true do |t|
    t.string   "city_name",                                       :null => false
    t.string   "city_alias",    :limit => 100,                    :null => false
    t.integer  "state_id",                     :default => 0,     :null => false
    t.string   "state_name"
    t.integer  "city_std_code",                                   :null => false
    t.datetime "insertdate",                                      :null => false
    t.integer  "status",        :limit => 1,                      :null => false
    t.string   "IP",            :limit => 100,                    :null => false
    t.boolean  "is_fg",                        :default => false, :null => false
    t.integer  "priority",                     :default => 0
  end

  add_index "tc_city", ["status"], :name => "NewIndex1"

  create_table "tc_classified_category", :primary_key => "category", :force => true do |t|
    t.string   "category_text",                                   :null => false
    t.integer  "category_level",                                  :null => false
    t.string   "parent_category",                                 :null => false
    t.integer  "priority",                      :default => -1,   :null => false
    t.boolean  "status",                        :default => true, :null => false
    t.datetime "insertdate",                                      :null => false
    t.string   "IP",              :limit => 20,                   :null => false
  end

  create_table "tc_classified_category_old", :primary_key => "cat_id", :force => true do |t|
    t.string   "cat_name",       :limit => 50,                  :null => false
    t.string   "cat_short_name", :limit => 10, :default => "0", :null => false
    t.integer  "cat_p_id",                                      :null => false
    t.datetime "insertdate",                                    :null => false
    t.integer  "priority",                                      :null => false
    t.integer  "status",         :limit => 1,  :default => 0,   :null => false
    t.string   "IP",             :limit => 30,                  :null => false
  end

  create_table "tc_classified_comments", :primary_key => "cd_id", :force => true do |t|
    t.integer  "cd_response_id",                               :null => false
    t.string   "cd_name",        :limit => 50,                 :null => false
    t.string   "cd_email",       :limit => 50,                 :null => false
    t.text     "cd_comment",                                   :null => false
    t.string   "cd_city",        :limit => 100,                :null => false
    t.string   "cd_mobile",      :limit => 15,                 :null => false
    t.datetime "insertdate",                                   :null => false
    t.integer  "status",         :limit => 1,   :default => 1, :null => false
    t.string   "IP",             :limit => 30,                 :null => false
  end

  create_table "tc_classified_data", :primary_key => "cd_id", :force => true do |t|
    t.string   "cd_category_code",           :limit => 20
    t.string   "cd_category_name",           :limit => 50
    t.string   "cd_top_level_category_code", :limit => 20,                 :null => false
    t.string   "cd_top_level_category_name", :limit => 50,                 :null => false
    t.string   "cd_order_id",                :limit => 30,                 :null => false
    t.string   "cd_item_no",                 :limit => 30,                 :null => false
    t.string   "cd_sales_city",              :limit => 30,                 :null => false
    t.string   "cd_image_path",              :limit => 100,                :null => false
    t.string   "cd_email_address",           :limit => 50,                 :null => false
    t.string   "cd_mobile",                  :limit => 12,                 :null => false
    t.text     "cd_ad_text",                                               :null => false
    t.string   "cd_design_code",             :limit => 10,                 :null => false
    t.string   "cd_rating",                  :limit => 50
    t.integer  "is_paid",                    :limit => 1,   :default => 0, :null => false
    t.string   "cd_scheme_code",             :limit => 10,                 :null => false
    t.date     "cd_pub_start_date",                                        :null => false
    t.date     "cd_pub_end_date",                                          :null => false
    t.date     "cd_paid_start_date",                                       :null => false
    t.date     "cd_paid_end_date",                                         :null => false
    t.integer  "priority",                                                 :null => false
    t.datetime "insertdate",                                               :null => false
    t.string   "IP",                         :limit => 30,                 :null => false
    t.integer  "status",                     :limit => 1,   :default => 0, :null => false
  end

  create_table "tc_classified_data_old", :primary_key => "cd_id", :force => true do |t|
    t.integer  "cd_p_cat_id",                                      :null => false
    t.string   "cd_p_cat_name",      :limit => 50,                 :null => false
    t.string   "cd_p_cat_code",      :limit => 10,                 :null => false
    t.string   "cd_order_id",        :limit => 30,                 :null => false
    t.string   "cd_item_no",         :limit => 30,                 :null => false
    t.string   "cd_sales_org",       :limit => 30,                 :null => false
    t.string   "cd_image_path",      :limit => 100,                :null => false
    t.string   "cd_email_address",   :limit => 50,                 :null => false
    t.string   "cd_mobile",          :limit => 12,                 :null => false
    t.text     "cd_ad_text",                                       :null => false
    t.string   "cd_design_code",     :limit => 10,                 :null => false
    t.string   "cd_header_name",     :limit => 50,                 :null => false
    t.string   "cd_header_code",     :limit => 20,                 :null => false
    t.string   "cd_raiting",         :limit => 50
    t.integer  "is_paid",            :limit => 1,   :default => 0, :null => false
    t.string   "cd_scheme_code",     :limit => 10,                 :null => false
    t.date     "cd_pub_start_date",                                :null => false
    t.date     "cd_pub_end_date",                                  :null => false
    t.date     "cd_paid_start_date",                               :null => false
    t.date     "cd_paid_end_date",                                 :null => false
    t.datetime "insertdate",                                       :null => false
    t.string   "IP",                 :limit => 30,                 :null => false
    t.integer  "status",             :limit => 1,   :default => 0, :null => false
  end

  create_table "tc_client_estdetails", :primary_key => "client_id", :force => true do |t|
    t.integer  "client_est_id",        :limit => 8,                      :null => false
    t.integer  "client_client_id",     :limit => 8,                      :null => false
    t.string   "client_est_name",                                        :null => false
    t.string   "client_est_address",   :limit => 500,                    :null => false
    t.string   "client_est_landmark",                                    :null => false
    t.string   "client_est_phone",                                       :null => false
    t.string   "client_est_website",                                     :null => false
    t.string   "client_est_email",     :limit => 150,                    :null => false
    t.integer  "client_est_price",                                       :null => false
    t.text     "client_description",                                     :null => false
    t.string   "client_est_cuisine",   :limit => 150,                    :null => false
    t.string   "client_est_features",  :limit => 150,                    :null => false
    t.string   "client_est_services",  :limit => 150,                    :null => false
    t.string   "client_est_gps",       :limit => 100,                    :null => false
    t.string   "client_est_music_id",  :limit => 500
    t.text     "client_est_music_str"
    t.boolean  "client_est_is_menu",                  :default => false, :null => false
    t.boolean  "publish",                             :default => false, :null => false
    t.string   "ip",                   :limit => 15,                     :null => false
    t.datetime "insertdate",                                             :null => false
    t.boolean  "status",                              :default => true,  :null => false
  end

  create_table "tc_cmslog", :force => true do |t|
    t.string   "username",   :limit => 100, :null => false
    t.string   "password",                  :null => false
    t.string   "ip",         :limit => 20,  :null => false
    t.datetime "insertdate",                :null => false
  end

  create_table "tc_cmsmodules", :primary_key => "ID", :force => true do |t|
    t.string  "NAME",        :limit => 50
    t.string  "DISPLAYNAME", :limit => 150
    t.integer "MODULE_PID",  :limit => 1,   :default => 0,           :null => false
    t.boolean "IS_FG",                      :default => false,       :null => false
    t.integer "priorty",                                             :null => false
    t.string  "module_for",  :limit => 100, :default => "timescity"
    t.boolean "status",                                              :null => false
  end

  create_table "tc_coming_soon_register", :force => true do |t|
    t.string   "user_name",  :limit => 200, :null => false
    t.string   "user_email", :limit => 200, :null => false
    t.datetime "insertdate",                :null => false
    t.string   "ip",         :limit => 100, :null => false
  end

  create_table "tc_comment", :force => true do |t|
    t.integer  "comment_userid",    :limit => 8
    t.string   "comment_username",                                        :null => false
    t.string   "comment_useremail",                                       :null => false
    t.string   "editcomment",       :limit => 3,                          :null => false
    t.text     "comment",           :limit => 16777215
    t.integer  "comment_estid",     :limit => 8,                          :null => false
    t.integer  "author_id",         :limit => 8,                          :null => false
    t.string   "IP",                :limit => 16
    t.boolean  "flag",                                                    :null => false
    t.datetime "insertdate",                                              :null => false
    t.boolean  "status",                                :default => true, :null => false
  end

  add_index "tc_comment", ["comment_estid"], :name => "content_id"
  add_index "tc_comment", ["flag"], :name => "flag"
  add_index "tc_comment", ["status"], :name => "publish"

  create_table "tc_commentfilter", :force => true do |t|
    t.string "word",                :null => false
    t.string "status", :limit => 7, :null => false
  end

  create_table "tc_contact_us", :primary_key => "ID", :force => true do |t|
    t.string   "USERNAME"
    t.integer  "USER_ID",      :limit => 8,  :default => 0
    t.string   "USER_EMAIL",   :limit => 50,                        :null => false
    t.text     "USER_QUERY",                                        :null => false
    t.boolean  "STATUS",                     :default => true,      :null => false
    t.string   "contact_flag", :limit => 7,  :default => "contact", :null => false
    t.datetime "INSERTDATE",                                        :null => false
    t.string   "IP",           :limit => 25,                        :null => false
  end

  create_table "tc_country", :primary_key => "country_id", :force => true do |t|
    t.string    "country_name",                    :null => false
    t.string    "country_code",                    :null => false
    t.boolean   "status",       :default => false, :null => false
    t.timestamp "insertdate",                      :null => false
  end

  create_table "tc_crowd_nightlife", :force => true do |t|
    t.string   "crowd_type", :limit => 200
    t.datetime "insertdate"
    t.integer  "status",     :limit => 1
    t.string   "ip",         :limit => 50
  end

  create_table "tc_deal_discount", :force => true do |t|
    t.integer  "fk_id",                        :default => 0,     :null => false
    t.boolean  "flag",                         :default => true,  :null => false
    t.string   "fk_flag",       :limit => 5,   :default => "est", :null => false
    t.string   "price",         :limit => 10
    t.float    "percentage",    :limit => 4
    t.string   "name",                                            :null => false
    t.text     "dd_desc"
    t.datetime "dd_start_date"
    t.datetime "dd_end_date"
    t.string   "thumbnail"
    t.string   "screenshot"
    t.boolean  "non_ending",                   :default => false, :null => false
    t.integer  "created_by",                   :default => 0,     :null => false
    t.datetime "insertdate"
    t.integer  "status",        :limit => 1,                      :null => false
    t.string   "IP",            :limit => 100,                    :null => false
    t.integer  "flag1",         :limit => 1,   :default => 0,     :null => false
  end

  create_table "tc_deal_events", :primary_key => "dde_id", :force => true do |t|
    t.integer  "dde_est_id",                    :limit => 8,                           :null => false
    t.integer  "source_id"
    t.text     "events_teaser",                 :limit => 255
    t.string   "cat_id",                        :limit => 100
    t.string   "dde_title",                                                            :null => false
    t.boolean  "dde_flag",                                                             :null => false
    t.integer  "dde_userid",                    :limit => 8,        :default => 0,     :null => false
    t.string   "dde_username",                  :limit => 100,                         :null => false
    t.text     "dde_desc",                      :limit => 16777215
    t.integer  "city_id"
    t.integer  "zone_id"
    t.integer  "locality_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "dde_landmark"
    t.string   "dde_pincode",                   :limit => 100
    t.string   "dde_gps",                       :limit => 100
    t.string   "dde_phone",                     :limit => 100
    t.string   "toll_no",                       :limit => 200
    t.string   "dde_mobile",                    :limit => 200
    t.string   "dde_contact_name",              :limit => 100
    t.string   "dde_email",                     :limit => 100
    t.string   "dde_url",                       :limit => 100
    t.string   "dde_shopurl",                   :limit => 100
    t.float    "dde_lat",                       :limit => 10
    t.float    "dde_long",                      :limit => 10
    t.string   "dde_discount_percentage",       :limit => 100
    t.datetime "dde_start_date"
    t.datetime "dde_end_date"
    t.string   "dde_start_time",                :limit => 100
    t.string   "dde_end_time",                  :limit => 100
    t.string   "dde_tags"
    t.string   "dde_image_path"
    t.string   "event_price",                   :limit => 100
    t.integer  "dde_viewcount",                 :limit => 8,        :default => 0,     :null => false
    t.integer  "dde_commentcount",              :limit => 8,        :default => 0,     :null => false
    t.integer  "dde_attendeecount",             :limit => 8,        :default => 0,     :null => false
    t.datetime "insert_date",                                                          :null => false
    t.string   "IP",                            :limit => 225,                         :null => false
    t.boolean  "dde_is_recommended",                                :default => false, :null => false
    t.datetime "dde_is_recommended_insertdate",                                        :null => false
    t.string   "dde_event_ids",                                                        :null => false
    t.integer  "dde_priority",                  :limit => 1,        :default => 0,     :null => false
    t.boolean  "status",                                                               :null => false
    t.integer  "moderated_by"
    t.boolean  "moderation_status",                                 :default => false, :null => false
    t.boolean  "is_new_videos",                                     :default => false, :null => false
    t.boolean  "is_new_image_homepage",                             :default => false, :null => false
    t.boolean  "is_new_image_listing",                              :default => false, :null => false
    t.boolean  "is_new_image_nth",                                  :default => false, :null => false
    t.boolean  "is_recursive",                                      :default => false, :null => false
    t.text     "recursion_data",                :limit => 16777215
    t.boolean  "is_est_venue",                                      :default => false, :null => false
    t.string   "oldguid",                       :limit => 512
    t.string   "guid",                          :limit => 512
    t.integer  "author_id"
    t.datetime "created_date"
    t.string   "modified_by",                   :limit => 20
    t.datetime "modified_date"
    t.string   "deleted_by",                    :limit => 20
    t.datetime "deleted_date"
    t.integer  "last_modified_author_id"
    t.string   "multiple_timings",              :limit => 512
    t.integer  "health_status",                 :limit => 1,        :default => 0,     :null => false
    t.boolean  "is_editable",                                       :default => true,  :null => false
    t.integer  "assigned_to",                                                          :null => false
    t.string   "weekdays_checklist",            :limit => 200
    t.text     "last_remarks"
    t.boolean  "event_type",                                        :default => true,  :null => false
  end

  add_index "tc_deal_events", ["city_id", "status", "dde_flag", "dde_start_date", "dde_end_date"], :name => "ind_city_sta_flg_sd_ed"
  add_index "tc_deal_events", ["dde_est_id"], :name => "dde_est_id"

  create_table "tc_deal_events_category_master", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "section_image"
    t.integer  "p_id",                       :default => 0, :null => false
    t.datetime "insertdate",                                :null => false
    t.string   "ip",                                        :null => false
    t.string   "status",        :limit => 7,                :null => false
  end

  create_table "tc_deal_events_copy", :primary_key => "dde_id", :force => true do |t|
    t.integer  "dde_est_id",                    :limit => 8,                           :null => false
    t.integer  "cat_id"
    t.string   "dde_title",                                                            :null => false
    t.boolean  "dde_flag",                                                             :null => false
    t.integer  "dde_userid",                    :limit => 8,        :default => 0,     :null => false
    t.string   "dde_username",                  :limit => 100,                         :null => false
    t.text     "dde_desc",                      :limit => 16777215
    t.integer  "city_id"
    t.integer  "zone_id"
    t.integer  "locality_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "dde_landmark"
    t.string   "dde_pincode",                   :limit => 100
    t.string   "dde_gps",                       :limit => 100
    t.string   "dde_phone",                     :limit => 100
    t.string   "dde_contact_name",              :limit => 100
    t.string   "dde_email",                     :limit => 100
    t.string   "dde_url",                       :limit => 100
    t.string   "dde_shopurl",                   :limit => 100
    t.string   "dde_discount_percentage",       :limit => 100
    t.datetime "dde_start_date"
    t.datetime "dde_end_date"
    t.string   "dde_start_time",                :limit => 100
    t.string   "dde_end_time",                  :limit => 100
    t.string   "dde_tags"
    t.string   "dde_image_path"
    t.string   "event_price",                   :limit => 100
    t.integer  "dde_viewcount",                 :limit => 8,        :default => 0,     :null => false
    t.integer  "dde_commentcount",              :limit => 8,        :default => 0,     :null => false
    t.integer  "dde_attendeecount",             :limit => 8,        :default => 0,     :null => false
    t.datetime "insert_date",                                                          :null => false
    t.string   "IP",                            :limit => 225,                         :null => false
    t.boolean  "dde_is_recommended",                                :default => false, :null => false
    t.datetime "dde_is_recommended_insertdate",                                        :null => false
    t.string   "dde_event_ids",                                                        :null => false
    t.integer  "dde_priority",                  :limit => 1,        :default => 0,     :null => false
    t.boolean  "status",                                                               :null => false
    t.boolean  "is_recursive",                                      :default => false, :null => false
    t.text     "recursion_data",                :limit => 16777215
    t.string   "guid",                          :limit => 512
  end

  add_index "tc_deal_events_copy", ["dde_est_id"], :name => "dde_est_id"

  create_table "tc_deal_events_tmp", :force => true do |t|
    t.integer  "dde_id",                        :limit => 8,                           :null => false
    t.integer  "dde_est_id",                    :limit => 8,                           :null => false
    t.integer  "source_id"
    t.text     "events_teaser",                 :limit => 255
    t.string   "cat_id",                        :limit => 100
    t.string   "dde_title",                                                            :null => false
    t.boolean  "dde_flag",                                                             :null => false
    t.integer  "dde_userid",                    :limit => 8,        :default => 0,     :null => false
    t.string   "dde_username",                  :limit => 100,                         :null => false
    t.text     "dde_desc",                      :limit => 16777215
    t.integer  "city_id"
    t.integer  "zone_id"
    t.integer  "locality_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "dde_landmark"
    t.string   "dde_pincode",                   :limit => 100
    t.string   "dde_gps",                       :limit => 100
    t.string   "dde_phone",                     :limit => 100
    t.string   "toll_no",                       :limit => 200
    t.string   "dde_mobile",                    :limit => 200
    t.string   "dde_contact_name",              :limit => 100
    t.string   "dde_email",                     :limit => 100
    t.string   "dde_url",                       :limit => 100
    t.string   "dde_shopurl",                   :limit => 100
    t.float    "dde_lat",                       :limit => 10
    t.float    "dde_long",                      :limit => 10
    t.string   "dde_discount_percentage",       :limit => 100
    t.datetime "dde_start_date"
    t.datetime "dde_end_date"
    t.string   "dde_start_time",                :limit => 100
    t.string   "dde_end_time",                  :limit => 100
    t.string   "dde_tags"
    t.string   "dde_image_path"
    t.string   "event_price",                   :limit => 100
    t.integer  "dde_viewcount",                 :limit => 8,        :default => 0,     :null => false
    t.integer  "dde_commentcount",              :limit => 8,        :default => 0,     :null => false
    t.integer  "dde_attendeecount",             :limit => 8,        :default => 0,     :null => false
    t.datetime "insert_date",                                                          :null => false
    t.string   "IP",                            :limit => 225,                         :null => false
    t.boolean  "dde_is_recommended",                                :default => false, :null => false
    t.datetime "dde_is_recommended_insertdate",                                        :null => false
    t.string   "dde_event_ids",                                                        :null => false
    t.integer  "dde_priority",                  :limit => 1,        :default => 0,     :null => false
    t.boolean  "status",                                                               :null => false
    t.integer  "moderated_by"
    t.boolean  "moderation_status",                                 :default => false, :null => false
    t.boolean  "is_new_videos",                                     :default => false, :null => false
    t.boolean  "is_new_image_homepage",                             :default => false, :null => false
    t.boolean  "is_new_image_listing",                              :default => false, :null => false
    t.boolean  "is_new_image_nth",                                  :default => false, :null => false
    t.boolean  "is_recursive",                                      :default => false, :null => false
    t.text     "recursion_data",                :limit => 16777215
    t.boolean  "is_est_venue",                                      :default => false, :null => false
    t.string   "guid",                          :limit => 512
    t.integer  "author_id"
    t.integer  "last_modified_author_id"
    t.string   "multiple_timings",              :limit => 512
    t.integer  "health_status",                 :limit => 1,        :default => 0,     :null => false
    t.boolean  "is_editable",                                       :default => true,  :null => false
    t.integer  "assigned_to",                                                          :null => false
    t.text     "last_remarks"
    t.string   "weekdays_checklist",            :limit => 200
    t.boolean  "event_type",                                        :default => true,  :null => false
    t.datetime "modified_date"
  end

  add_index "tc_deal_events_tmp", ["dde_est_id"], :name => "dde_est_id"
  add_index "tc_deal_events_tmp", ["dde_id"], :name => "dde_id"

  create_table "tc_dishes", :primary_key => "dish_id", :force => true do |t|
    t.string   "dish_name",                                     :null => false
    t.string   "dish_type",   :limit => 5,  :default => "dish", :null => false
    t.boolean  "dish_ref"
    t.boolean  "dish_status",               :default => true,   :null => false
    t.string   "IP",          :limit => 20
    t.datetime "insert_date",                                   :null => false
  end

  add_index "tc_dishes", ["dish_status"], :name => "dish_status"

  create_table "tc_est_category", :primary_key => "est_cat_id", :force => true do |t|
    t.string   "est_cat_name",                                       :null => false
    t.datetime "insertdate",                                         :null => false
    t.integer  "status",           :limit => 1,                      :null => false
    t.string   "IP",               :limit => 100,                    :null => false
    t.integer  "est_cat_parentid",                                   :null => false
    t.boolean  "is_fg",                           :default => false, :null => false
    t.boolean  "is_event",                        :default => false, :null => false
  end

  create_table "tc_est_cuisines", :primary_key => "cui_id", :force => true do |t|
    t.string   "cuisines_name", :limit => 250,                    :null => false
    t.text     "cuisines_desc"
    t.datetime "insertdate",                                      :null => false
    t.integer  "status",        :limit => 1,                      :null => false
    t.string   "IP",            :limit => 100,                    :null => false
    t.boolean  "is_fg",                        :default => false, :null => false
  end

  add_index "tc_est_cuisines", ["cui_id", "status"], :name => "NewIndex1"

  create_table "tc_est_event_deamapping", :force => true do |t|
    t.boolean "content_type",                :default => false
    t.integer "city_id",      :limit => 1,                      :null => false
    t.integer "content_id",                  :default => 0
    t.string  "content_name", :limit => 200,                    :null => false
    t.integer "deal_id",                     :default => 0
  end

  create_table "tc_est_features", :primary_key => "feature_id", :force => true do |t|
    t.string   "feature_name",      :limit => 250,                :null => false
    t.datetime "insertdate",                                      :null => false
    t.integer  "status",            :limit => 1,                  :null => false
    t.string   "IP",                :limit => 100,                :null => false
    t.integer  "est_venue_flag",    :limit => 1,   :default => 0
    t.string   "feature_thumbnail"
  end

  add_index "tc_est_features", ["feature_id", "status"], :name => "NewIndex1"

  create_table "tc_est_groups", :primary_key => "est_grp_id", :force => true do |t|
    t.string   "est_grp_name",                    :null => false
    t.string   "est_grp_desc",                    :null => false
    t.integer  "est_grp_category"
    t.string   "logo",             :limit => 200, :null => false
    t.datetime "insertdate",                      :null => false
    t.integer  "status",           :limit => 1,   :null => false
    t.string   "IP",               :limit => 100, :null => false
  end

  create_table "tc_est_media", :primary_key => "est_media_id", :force => true do |t|
    t.string   "est_media_name",                                          :null => false
    t.string   "est_media_caption",  :limit => 250
    t.integer  "est_id",                            :default => 0,        :null => false
    t.string   "est_flag",           :limit => 20
    t.integer  "est_priority",                      :default => 0
    t.string   "est_by",             :limit => 6,   :default => "editor"
    t.integer  "est_media_userid",   :limit => 8
    t.string   "est_media_username"
    t.integer  "created_by",                        :default => 0,        :null => false
    t.datetime "insertdate",                                              :null => false
    t.integer  "status",             :limit => 1,   :default => 1,        :null => false
    t.string   "IP",                 :limit => 100,                       :null => false
  end

  add_index "tc_est_media", ["est_id", "est_flag", "status"], :name => "NewIndex1"

  create_table "tc_est_payments", :primary_key => "est_payment_id", :force => true do |t|
    t.string   "est_payment_name", :limit => 250, :null => false
    t.datetime "insertdate",                      :null => false
    t.integer  "status",           :limit => 1,   :null => false
    t.string   "IP",               :limit => 100, :null => false
  end

  create_table "tc_est_types", :primary_key => "est_type_id", :force => true do |t|
    t.string   "est_type_name", :limit => 250, :null => false
    t.datetime "insertdate",                   :null => false
    t.integer  "status",        :limit => 1,   :null => false
    t.string   "IP",            :limit => 100, :null => false
  end

  create_table "tc_est_usp", :primary_key => "est_usp_id", :force => true do |t|
    t.string   "est_usp_name", :limit => 250, :null => false
    t.datetime "insertdate",                  :null => false
    t.integer  "status",       :limit => 1,   :null => false
    t.string   "IP",           :limit => 100, :null => false
  end

  create_table "tc_est_video", :primary_key => "est_video_id", :force => true do |t|
    t.string   "est_video_name",                                     :null => false
    t.text     "est_video_code"
    t.integer  "est_id",                          :default => 0,     :null => false
    t.string   "est_video_source", :limit => 250
    t.string   "est_video_url",    :limit => 250
    t.integer  "est_video_views",                 :default => 0
    t.boolean  "est_by",                          :default => true,  :null => false
    t.integer  "est_priority",                    :default => 0
    t.boolean  "flag",                            :default => false, :null => false
    t.integer  "created_by",                      :default => 0,     :null => false
    t.datetime "insertdate",                                         :null => false
    t.integer  "status",           :limit => 1,                      :null => false
    t.string   "IP",               :limit => 100,                    :null => false
    t.integer  "assigned_to",                                        :null => false
  end

  add_index "tc_est_video", ["est_id", "flag", "status"], :name => "ind_est_flag_sta"

  create_table "tc_establishments", :primary_key => "est_id", :force => true do |t|
    t.string   "est_name",                                                    :null => false
    t.integer  "source_id"
    t.text     "est_description",      :limit => 255
    t.text     "est_desc",             :limit => 16777215
    t.string   "est_informal_name"
    t.string   "est_name_why",                                                :null => false
    t.string   "est_prev_name"
    t.integer  "est_est_grp_id",                                              :null => false
    t.string   "est_add1",                                                    :null => false
    t.string   "est_add2"
    t.string   "est_landmark"
    t.integer  "est_loc_id",           :limit => 8,                           :null => false
    t.string   "est_loc_name",         :limit => 200
    t.integer  "est_city_id",                                                 :null => false
    t.string   "est_city_name",        :limit => 200
    t.integer  "est_zone_id",                                                 :null => false
    t.string   "est_zone_name",        :limit => 200,                         :null => false
    t.string   "est_pin_code",         :limit => 10,                          :null => false
    t.string   "est_phone"
    t.string   "est_phone_alias"
    t.string   "est_gps_cood",         :limit => 100
    t.string   "est_website"
    t.string   "est_nr_bus_stop",      :limit => 100
    t.string   "est_nr_train_station", :limit => 100
    t.string   "est_owner_name"
    t.text     "est_owner_review",     :limit => 16777215
    t.string   "est_manager_name"
    t.string   "est_hotel_name"
    t.text     "est_timings",          :limit => 16777215
    t.boolean  "est_break",                                :default => false
    t.string   "est_breakdays",        :limit => 50
    t.boolean  "est_lunch",                                :default => false
    t.string   "est_lunchdays",        :limit => 50
    t.boolean  "est_eve",                                  :default => false
    t.boolean  "est_dinner",                               :default => false
    t.string   "est_dinnerdays",       :limit => 50
    t.integer  "est_two_price",                            :default => 0
    t.datetime "est_feature_date"
    t.datetime "est_launch_date"
    t.string   "est_capacity",         :limit => 100
    t.text     "est_types",            :limit => 16777215
    t.text     "est_types_id",         :limit => 16777215
    t.text     "est_services_id",      :limit => 16777215
    t.text     "est_features_id",      :limit => 16777215
    t.text     "est_payment_id",       :limit => 16777215
    t.text     "est_usp_id",           :limit => 16777215
    t.text     "est_cuisines",         :limit => 16777215
    t.text     "est_services",         :limit => 16777215
    t.text     "est_features",         :limit => 16777215
    t.text     "est_pay_options",      :limit => 16777215
    t.string   "est_cover_charge",     :limit => 100
    t.string   "est_entry_fee",        :limit => 100
    t.string   "est_ladies_fee",       :limit => 100
    t.string   "est_happy_hours",      :limit => 100
    t.string   "est_tips"
    t.string   "est_specialities"
    t.string   "est_famous_for"
    t.string   "est_usp"
    t.text     "est_editor_review"
    t.text     "est_crowd_ids",        :limit => 16777215
    t.text     "est_music_ids",        :limit => 16777215
    t.text     "est_which_type",       :limit => 255
    t.boolean  "est_which_type_id",                        :default => false
    t.text     "est_music_str"
    t.text     "est_crowd_str"
    t.boolean  "est_is_featured",                          :default => false
    t.float    "est_food_rating",                          :default => 0.0
    t.float    "est_service_rating",                       :default => 0.0
    t.float    "est_decor_rating",                         :default => 0.0
    t.float    "est_buzz_rating"
    t.string   "est_src_name"
    t.string   "est_src_url"
    t.text     "est_tags",             :limit => 16777215
    t.string   "oldguid",              :limit => 512
    t.string   "est_guid",             :limit => 512,                         :null => false
    t.string   "est_email",            :limit => 100,                         :null => false
    t.boolean  "est_package",                              :default => false, :null => false
    t.integer  "est_review_cnt",       :limit => 8,        :default => 0,     :null => false
    t.integer  "est_viewcount",        :limit => 8,        :default => 0,     :null => false
    t.integer  "est_event_viewcount",  :limit => 8,        :default => 0,     :null => false
    t.integer  "est_rate_cnt",         :limit => 8,        :default => 0
    t.integer  "est_cat_id"
    t.integer  "est_client_id",        :limit => 8,        :default => 0,     :null => false
    t.string   "created_by",           :limit => 100
    t.datetime "created_date"
    t.string   "modified_by",          :limit => 100
    t.datetime "modified_date"
    t.integer  "moderated_by",                             :default => 0,     :null => false
    t.string   "deleted_by",           :limit => 100
    t.datetime "deleted_date"
    t.integer  "moderation_status",                        :default => 0,     :null => false
    t.integer  "is_deleted",           :limit => 1,                           :null => false
    t.integer  "status",               :limit => 1,                           :null => false
    t.string   "IP",                   :limit => 100,                         :null => false
    t.boolean  "is_fg",                                    :default => false, :null => false
    t.string   "metatitle",                                                   :null => false
    t.string   "metakeyword",          :limit => 500,                         :null => false
    t.string   "metadescription",      :limit => 500,                         :null => false
    t.text     "est_embed_code"
    t.boolean  "is_new_awards",                            :default => false, :null => false
    t.boolean  "is_new_videos",                            :default => false, :null => false
    t.boolean  "is_new_images",                            :default => false, :null => false
    t.boolean  "is_new_menu",                              :default => false, :null => false
    t.boolean  "is_new_deal",                              :default => false, :null => false
    t.integer  "tc_est_health_status", :limit => 1,        :default => 0,     :null => false
    t.boolean  "is_editable",                              :default => true,  :null => false
    t.integer  "assigned_to",                                                 :null => false
    t.string   "est_facebook_url"
    t.float    "user_avg_rate",                                               :null => false
    t.integer  "tc_whats_new",                             :default => 0
    t.string   "tmp_est_landline"
    t.string   "tmp_est_mobile"
    t.string   "est_mobile"
    t.string   "est_toll_free"
    t.string   "est_byline",           :limit => 100,                         :null => false
  end

  add_index "tc_establishments", ["est_city_id", "status"], :name => "ind_city_sta"

  create_table "tc_establishments_proximity", :primary_key => "est_id", :force => true do |t|
    t.string "est_name",                       :null => false
    t.string "est_gps_cood",    :limit => 100
    t.float  "lat",             :limit => 10
    t.float  "lng",             :limit => 10
    t.float  "est_food_rating", :limit => 4
    t.string "est_landmark"
    t.string "est_phone"
    t.string "est_add1"
    t.string "est_add2"
    t.binary "est_which_type",  :limit => 100
    t.string "est_city_name",   :limit => 200
    t.string "est_zone_name",   :limit => 200
    t.string "est_loc_name",    :limit => 200
  end

  add_index "tc_establishments_proximity", ["est_which_type"], :name => "est_which_type"

  create_table "tc_establishments_temp_proximity", :primary_key => "est_id", :force => true do |t|
    t.string "est_name",                       :null => false
    t.string "est_gps_cood",    :limit => 100
    t.float  "lat",             :limit => 10
    t.float  "lng",             :limit => 10
    t.float  "est_food_rating", :limit => 4
    t.string "est_landmark"
    t.string "est_phone"
    t.string "est_add1"
    t.string "est_add2"
    t.binary "est_which_type",  :limit => 100
    t.string "est_city_name",   :limit => 200
    t.string "est_zone_name",   :limit => 200
    t.string "est_loc_name",    :limit => 200
  end

  create_table "tc_establishments_tmp", :force => true do |t|
    t.integer  "est_id",               :limit => 8,                           :null => false
    t.string   "est_name",                                                    :null => false
    t.integer  "source_id"
    t.text     "est_description",      :limit => 255
    t.text     "est_desc",             :limit => 16777215
    t.string   "est_informal_name"
    t.string   "est_name_why",                                                :null => false
    t.string   "est_prev_name"
    t.integer  "est_est_grp_id",                                              :null => false
    t.string   "est_add1",                                                    :null => false
    t.string   "est_add2"
    t.string   "est_landmark"
    t.integer  "est_loc_id",           :limit => 8,                           :null => false
    t.string   "est_loc_name",         :limit => 200
    t.integer  "est_city_id",                                                 :null => false
    t.string   "est_city_name",        :limit => 200
    t.integer  "est_zone_id",                                                 :null => false
    t.string   "est_zone_name",        :limit => 200,                         :null => false
    t.string   "est_pin_code",         :limit => 10,                          :null => false
    t.string   "est_phone"
    t.string   "est_gps_cood",         :limit => 100
    t.string   "est_website"
    t.string   "est_nr_bus_stop",      :limit => 100
    t.string   "est_nr_train_station", :limit => 100
    t.string   "est_owner_name"
    t.text     "est_owner_review",     :limit => 16777215
    t.string   "est_manager_name"
    t.string   "est_hotel_name"
    t.text     "est_timings",          :limit => 16777215
    t.boolean  "est_break",                                :default => false
    t.string   "est_breakdays",        :limit => 50
    t.boolean  "est_lunch",                                :default => false
    t.string   "est_lunchdays",        :limit => 50
    t.boolean  "est_eve",                                  :default => false
    t.boolean  "est_dinner",                               :default => false
    t.string   "est_dinnerdays",       :limit => 50
    t.integer  "est_two_price",                            :default => 0
    t.datetime "est_feature_date"
    t.datetime "est_launch_date"
    t.string   "est_capacity",         :limit => 100
    t.text     "est_types",            :limit => 16777215
    t.text     "est_types_id",         :limit => 16777215
    t.text     "est_services_id",      :limit => 16777215
    t.text     "est_features_id",      :limit => 16777215
    t.text     "est_payment_id",       :limit => 16777215
    t.text     "est_usp_id",           :limit => 16777215
    t.text     "est_cuisines",         :limit => 16777215
    t.text     "est_services",         :limit => 16777215
    t.text     "est_features",         :limit => 16777215
    t.text     "est_pay_options",      :limit => 16777215
    t.string   "est_cover_charge",     :limit => 100
    t.string   "est_entry_fee",        :limit => 100
    t.string   "est_ladies_fee",       :limit => 100
    t.string   "est_happy_hours",      :limit => 100
    t.string   "est_tips"
    t.string   "est_specialities"
    t.string   "est_famous_for"
    t.string   "est_usp"
    t.text     "est_editor_review"
    t.text     "est_crowd_ids",        :limit => 16777215
    t.text     "est_music_ids",        :limit => 16777215
    t.text     "est_which_type",       :limit => 255
    t.boolean  "est_which_type_id",                        :default => false
    t.text     "est_music_str"
    t.text     "est_crowd_str"
    t.boolean  "est_is_featured",                          :default => false
    t.float    "est_food_rating",                          :default => 0.0
    t.float    "est_service_rating",                       :default => 0.0
    t.float    "est_decor_rating",                         :default => 0.0
    t.float    "est_buzz_rating"
    t.string   "est_src_name"
    t.string   "est_src_url"
    t.text     "est_tags",             :limit => 16777215
    t.string   "est_guid",                                                    :null => false
    t.string   "est_email",            :limit => 100,                         :null => false
    t.boolean  "est_package",                              :default => false, :null => false
    t.integer  "est_review_cnt",       :limit => 8,        :default => 0,     :null => false
    t.integer  "est_viewcount",        :limit => 8,        :default => 0,     :null => false
    t.integer  "est_event_viewcount",  :limit => 8,        :default => 0,     :null => false
    t.integer  "est_rate_cnt",         :limit => 8,        :default => 0
    t.integer  "est_cat_id"
    t.integer  "est_client_id",        :limit => 8,        :default => 0,     :null => false
    t.string   "created_by",           :limit => 100
    t.datetime "created_date"
    t.string   "modified_by",          :limit => 100
    t.datetime "modified_date"
    t.integer  "is_deleted",           :limit => 1,                           :null => false
    t.integer  "status",               :limit => 1,                           :null => false
    t.string   "IP",                   :limit => 100,                         :null => false
    t.boolean  "is_fg",                                    :default => false, :null => false
    t.string   "metatitle",                                                   :null => false
    t.string   "metakeyword",          :limit => 500,                         :null => false
    t.string   "metadescription",      :limit => 500,                         :null => false
    t.text     "est_embed_code"
    t.boolean  "is_new_awards",                            :default => false, :null => false
    t.boolean  "is_new_videos",                            :default => false, :null => false
    t.boolean  "is_new_images",                            :default => false, :null => false
    t.boolean  "is_new_menu",                              :default => false, :null => false
    t.boolean  "is_new_deal",                              :default => false, :null => false
    t.integer  "tc_est_health_status", :limit => 1,        :default => 0,     :null => false
    t.boolean  "is_editable",                              :default => true,  :null => false
    t.integer  "assigned_to",                                                 :null => false
    t.text     "last_remarks"
    t.string   "est_facebook_url"
    t.integer  "tc_whats_new",                             :default => 0
    t.string   "tmp_est_landline"
    t.string   "tmp_est_mobile"
    t.string   "est_mobile"
    t.string   "est_toll_free"
    t.string   "est_byline",           :limit => 100,                         :null => false
  end

  add_index "tc_establishments_tmp", ["est_loc_id", "est_city_id", "est_which_type_id", "status"], :name => "NewIndex2"

  create_table "tc_estdetails", :force => true do |t|
    t.integer  "est_id",           :limit => 8,                       :null => false
    t.string   "est_name",                                            :null => false
    t.string   "est_address",      :limit => 500
    t.string   "est_landmark"
    t.string   "est_phone"
    t.string   "est_website"
    t.string   "est_email",        :limit => 150
    t.integer  "est_price",                            :default => 0
    t.text     "est_owner_review", :limit => 16777215
    t.string   "est_cuisine",      :limit => 150
    t.string   "est_features",     :limit => 150
    t.string   "est_services",     :limit => 150
    t.string   "est_gps",          :limit => 100
    t.string   "est_music_id",     :limit => 500
    t.text     "est_music_str"
    t.string   "est_guid",                                            :null => false
    t.string   "ip",               :limit => 15
    t.datetime "insertdate"
  end

  create_table "tc_event_attendee", :primary_key => "at_id", :force => true do |t|
    t.integer  "at_user_id",   :limit => 8
    t.string   "at_user_name"
    t.integer  "at_event_id",  :limit => 8,  :default => 0,    :null => false
    t.datetime "insertdate"
    t.boolean  "status",                     :default => true
    t.string   "IP",           :limit => 20
  end

  create_table "tc_events_est_venues", :force => true do |t|
    t.integer "event_id",         :limit => 8,                    :null => false
    t.integer "est_venue_id",     :limit => 8,                    :null => false
    t.integer "type",             :limit => 1,                    :null => false
    t.string  "est_venue_name"
    t.string  "zone",             :limit => 50
    t.string  "location"
    t.float   "lat",              :limit => 10
    t.float   "lng",              :limit => 10
    t.integer "last_edited_user"
    t.boolean "status",                         :default => true, :null => false
  end

  add_index "tc_events_est_venues", ["est_venue_id", "type", "status"], :name => "ind_est_venue_id_type_sta"
  add_index "tc_events_est_venues", ["event_id"], :name => "event_id_fk"

  create_table "tc_featured_events", :primary_key => "feature_id", :force => true do |t|
    t.integer  "city_id"
    t.string   "featured_events"
    t.integer  "created_by"
    t.datetime "created_date",    :null => false
    t.boolean  "status",          :null => false
  end

  create_table "tc_featured_movies", :primary_key => "feature_id", :force => true do |t|
    t.integer  "city_id"
    t.string   "featured_movies"
    t.integer  "created_by"
    t.datetime "created_date",    :null => false
    t.boolean  "status",          :null => false
  end

  create_table "tc_genre", :primary_key => "genre_id", :force => true do |t|
    t.string   "genre_name",                  :null => false
    t.string   "genre_alias",  :limit => 100, :null => false
    t.string   "genre_tracks",                :null => false
    t.datetime "insertdate",                  :null => false
    t.integer  "status",       :limit => 1,   :null => false
    t.string   "IP",           :limit => 100, :null => false
  end

  create_table "tc_genres", :force => true do |t|
    t.string   "name",    :limit => 200, :null => false
    t.datetime "created",                :null => false
    t.integer  "status",  :limit => 1,   :null => false
  end

  create_table "tc_good_to_go", :primary_key => "gtg_id", :force => true do |t|
    t.text     "gtg_est_id",                    :null => false
    t.integer  "gtg_city_id", :default => 0
    t.integer  "gtg_zone_id", :default => 0
    t.integer  "gtg_loc_id",  :default => 0
    t.string   "gtg_name",                      :null => false
    t.boolean  "gtg_enabled",                   :null => false
    t.boolean  "gtg_type",                      :null => false
    t.datetime "insert_date",                   :null => false
    t.boolean  "gtg_status",  :default => true, :null => false
    t.string   "ip",                            :null => false
  end

  create_table "tc_home_section", :primary_key => "section_id", :force => true do |t|
    t.string   "section_title",                                               :null => false
    t.integer  "section_city",                                                :null => false
    t.integer  "section_zone"
    t.integer  "section_locality"
    t.text     "section_url"
    t.integer  "est_which_type",            :limit => 1
    t.integer  "section_box_name",          :limit => 1,                      :null => false
    t.boolean  "section_list_type"
    t.string   "section_est_types_ids"
    t.string   "section_est_feature_ids"
    t.string   "section_cuisines_ids"
    t.string   "section_services_ids"
    t.string   "section_start_rate"
    t.string   "section_end_rate"
    t.string   "section_start_price"
    t.string   "section_end_price"
    t.boolean  "section_est_which_type_id",                :default => false
    t.string   "section_est_ids"
    t.string   "section_summary",           :limit => 500,                    :null => false
    t.string   "section_thumbnail"
    t.string   "sub_section_title",         :limit => 200,                    :null => false
    t.integer  "section_priority",                         :default => 0,     :null => false
    t.string   "status",                    :limit => 1,   :default => "1",   :null => false
    t.datetime "insertdate",                                                  :null => false
    t.string   "IP",                        :limit => 30,                     :null => false
    t.string   "guid",                      :limit => 200
    t.boolean  "is_index_page",                            :default => false, :null => false
  end

  add_index "tc_home_section", ["section_city", "section_box_name", "status"], :name => "ind_city_sec_sta"

  create_table "tc_home_section_bk", :primary_key => "section_id", :force => true do |t|
    t.string   "section_title",                                               :null => false
    t.integer  "section_city",                                                :null => false
    t.integer  "section_zone"
    t.integer  "section_locality"
    t.text     "section_url"
    t.integer  "est_which_type",            :limit => 1
    t.integer  "section_box_name",          :limit => 1,                      :null => false
    t.boolean  "section_list_type"
    t.string   "section_est_types_ids"
    t.string   "section_est_feature_ids"
    t.string   "section_cuisines_ids"
    t.string   "section_services_ids"
    t.string   "section_start_rate"
    t.string   "section_end_rate"
    t.string   "section_start_price"
    t.string   "section_end_price"
    t.boolean  "section_est_which_type_id",                :default => false
    t.string   "section_est_ids"
    t.string   "section_summary",           :limit => 500,                    :null => false
    t.string   "section_thumbnail"
    t.string   "sub_section_title",         :limit => 200,                    :null => false
    t.integer  "section_priority",                         :default => 0,     :null => false
    t.string   "status",                    :limit => 1,   :default => "1",   :null => false
    t.datetime "insertdate",                                                  :null => false
    t.string   "IP",                        :limit => 30,                     :null => false
    t.string   "guid",                      :limit => 200
    t.boolean  "is_index_page",                            :default => false, :null => false
  end

  create_table "tc_hot_content", :force => true do |t|
    t.integer "content_id",                  :null => false
    t.integer "parent_id",                   :null => false
    t.integer "content_type", :limit => 1,   :null => false
    t.text    "description",                 :null => false
    t.string  "image",        :limit => 200, :null => false
  end

  create_table "tc_languagemaster", :primary_key => "iLaunguageID", :force => true do |t|
    t.string   "cLanguageName",                 :null => false
    t.string   "cLanguageCode",   :limit => 50, :null => false
    t.datetime "dInsertDatetime",               :null => false
    t.integer  "iStatus",                       :null => false
  end

  add_index "tc_languagemaster", ["iStatus"], :name => "NewIndex1"

  create_table "tc_lattitude", :force => true do |t|
    t.float  "latitude",     :null => false
    t.float  "longitude",    :null => false
    t.string "city",         :null => false
    t.string "neghbourhood", :null => false
    t.string "est_category", :null => false
    t.string "est_name",     :null => false
  end

  create_table "tc_locality", :primary_key => "loc_id", :force => true do |t|
    t.integer  "loc_city_id",                                        :null => false
    t.integer  "loc_zone_id",                                        :null => false
    t.string   "loc_name",                                           :null => false
    t.string   "loc_alias"
    t.string   "loc_near_by",      :limit => 500
    t.integer  "restaurant_count"
    t.integer  "nightlife_count"
    t.datetime "insertdate",                                         :null => false
    t.integer  "status",           :limit => 1,                      :null => false
    t.string   "IP",               :limit => 100,                    :null => false
    t.boolean  "is_fg",                           :default => false, :null => false
    t.integer  "loc_priority",     :limit => 1
  end

  add_index "tc_locality", ["loc_city_id", "loc_zone_id"], :name => "NewIndex1"

  create_table "tc_metadata", :force => true do |t|
    t.string "metatitle",                      :null => false
    t.string "metakeywords",    :limit => 500, :null => false
    t.string "metadescription", :limit => 500, :null => false
    t.string "city",                           :null => false
    t.string "neghbourhood",                   :null => false
    t.string "est_category",                   :null => false
    t.string "est_name",                       :null => false
    t.string "foodtype",                       :null => false
    t.string "webURL",                         :null => false
    t.string "Phone",           :limit => 50,  :null => false
    t.string "landmark",                       :null => false
    t.string "description",     :limit => 500, :null => false
  end

  create_table "tc_micro_agp", :force => true do |t|
    t.string   "name",                                              :null => false
    t.string   "email",                                             :null => false
    t.date     "dob",                                               :null => false
    t.string   "city",            :limit => 100,                    :null => false
    t.integer  "phone",           :limit => 8,                      :null => false
    t.boolean  "ans_id",                                            :null => false
    t.string   "ans_string",                                        :null => false
    t.string   "ques_string",                                       :null => false
    t.string   "micro_site_name", :limit => 30,  :default => "AGP", :null => false
    t.datetime "insertdate",                                        :null => false
    t.string   "IP",              :limit => 30,                     :null => false
  end

  create_table "tc_micro_mailer_agp", :force => true do |t|
    t.integer "user_id",                               :null => false
    t.string  "user_fname",                            :null => false
    t.string  "user_lname",                            :null => false
    t.string  "user_email",                            :null => false
    t.boolean "user_is_activated",                     :null => false
    t.boolean "is_mail_sent_three", :default => false, :null => false
    t.boolean "is_mail_sent_four",  :default => false, :null => false
    t.boolean "is_mail_sent",                          :null => false
  end

  create_table "tc_micro_mailer_agp_metadata", :force => true do |t|
    t.date    "date_fld", :null => false
    t.integer "counter",  :null => false
  end

  create_table "tc_modifieddata", :force => true do |t|
    t.string  "tablename",   :limit => 100,        :null => false
    t.integer "tableid",                           :null => false
    t.binary  "modifiedata", :limit => 2147483647
  end

  create_table "tc_movie_city_master", :primary_key => "iCityId", :force => true do |t|
    t.string   "cCityName",       :null => false
    t.integer  "iCityParentId",   :null => false
    t.integer  "iStateId",        :null => false
    t.datetime "dInsertDatetime", :null => false
    t.integer  "iStatus",         :null => false
  end

  create_table "tc_movie_master", :primary_key => "iMovieId", :force => true do |t|
    t.string   "cMovieName",                                        :null => false
    t.text     "cCast",             :limit => 255,                  :null => false
    t.text     "cSynopsis",                                         :null => false
    t.string   "cImage",                                            :null => false
    t.integer  "iLaunguageID",                                      :null => false
    t.string   "cParentalGuidance", :limit => 5
    t.float    "iStarRating",                      :default => 0.0, :null => false
    t.float    "old_star_rating",                  :default => 0.0, :null => false
    t.float    "avg_user_rate",                    :default => 0.0, :null => false
    t.integer  "reviewCount",       :limit => 8,   :default => 0,   :null => false
    t.datetime "dReleaseDate",                                      :null => false
    t.datetime "dInsertDatetime",                                   :null => false
    t.integer  "iStatus",                                           :null => false
    t.string   "movieshortname",    :limit => 100,                  :null => false
    t.string   "genres",            :limit => 100,                  :null => false
    t.string   "tagline",           :limit => 100,                  :null => false
    t.text     "review"
    t.integer  "length"
    t.string   "moviedirector",     :limit => 100
    t.string   "musicdirector",     :limit => 100
    t.integer  "featured",                         :default => 2
    t.string   "deleted_by",        :limit => 20
    t.datetime "deleted_date"
    t.string   "oldguid"
    t.string   "guid",              :limit => 512,                  :null => false
    t.integer  "iTOIMovieId",       :limit => 8
    t.string   "cShortCode",        :limit => 30
    t.integer  "iReviewCount",      :limit => 8,   :default => 0,   :null => false
    t.integer  "iTopLevelCount",    :limit => 8,   :default => 0,   :null => false
    t.integer  "iRecommendCount",   :limit => 8,   :default => 0,   :null => false
    t.integer  "iAgreeCount",       :limit => 8,   :default => 0,   :null => false
    t.integer  "iDisagreeCount",    :limit => 8,   :default => 0,   :null => false
    t.string   "canonical_url",                                     :null => false
  end

  add_index "tc_movie_master", ["iLaunguageID", "iStatus"], :name => "iLaunguageID"

  create_table "tc_movie_theater_map", :primary_key => "iMtmId", :force => true do |t|
    t.integer  "iMovieId",          :limit => 8,  :null => false
    t.integer  "iTheaterId",        :limit => 8,  :null => false
    t.integer  "iLaunguageID",                    :null => false
    t.integer  "iCityId",                         :null => false
    t.datetime "dStartDatetime",                  :null => false
    t.datetime "dEndDatetime",                    :null => false
    t.datetime "dLastEndDatetime",                :null => false
    t.text     "cShowTime"
    t.text     "cNextWeekShowTime"
    t.datetime "dInsertDatetime",                 :null => false
    t.integer  "iStatus",                         :null => false
    t.string   "deleted_by",        :limit => 20
    t.datetime "deleted_date"
  end

  add_index "tc_movie_theater_map", ["iCityId", "iStatus"], :name => "cityStatusIndex"
  add_index "tc_movie_theater_map", ["iTheaterId", "iMovieId", "iCityId", "iLaunguageID", "iStatus"], :name => "iMovieId"

  create_table "tc_music_nightlife", :force => true do |t|
    t.string   "music_type", :limit => 200
    t.datetime "insertdate"
    t.integer  "status",     :limit => 1
    t.string   "ip",         :limit => 50
  end

  create_table "tc_newsletter", :primary_key => "nl_id", :force => true do |t|
    t.string   "nl_name",      :limit => 100,                    :null => false
    t.string   "nl_email",     :limit => 200,                    :null => false
    t.boolean  "nl_weekend",                  :default => false, :null => false
    t.boolean  "nl_fortnight",                :default => false, :null => false
    t.boolean  "nl_month",                    :default => false, :null => false
    t.boolean  "nl_allmumbai",                :default => false, :null => false
    t.string   "nl_city_id",   :limit => 200, :default => "0",   :null => false
    t.string   "nl_city_name",                                   :null => false
    t.boolean  "nl_food",                     :default => false, :null => false
    t.boolean  "nl_bar",                      :default => false, :null => false
    t.boolean  "nl_events",                   :default => false, :null => false
    t.boolean  "nl_deals",                    :default => false, :null => false
    t.datetime "insertdate",                                     :null => false
    t.string   "IP",           :limit => 20
    t.boolean  "status",                      :default => true
    t.boolean  "nl_extras",                   :default => false, :null => false
  end

  create_table "tc_newsletter_new", :primary_key => "nl_id", :force => true do |t|
    t.string   "nl_name",      :limit => 100,                    :null => false
    t.string   "nl_email",     :limit => 200,                    :null => false
    t.boolean  "nl_weekend",                  :default => false, :null => false
    t.boolean  "nl_fortnight",                :default => false, :null => false
    t.boolean  "nl_month",                    :default => false, :null => false
    t.boolean  "nl_allmumbai",                :default => false, :null => false
    t.boolean  "nl_city_id",                  :default => false, :null => false
    t.string   "nl_city_name",                                   :null => false
    t.boolean  "nl_food",                     :default => false, :null => false
    t.boolean  "nl_bar",                      :default => false, :null => false
    t.boolean  "nl_events",                   :default => false, :null => false
    t.boolean  "nl_deals",                    :default => false, :null => false
    t.datetime "insertdate",                                     :null => false
    t.string   "IP",           :limit => 20
    t.boolean  "status",                      :default => true
  end

  create_table "tc_overall_rating", :primary_key => "or_est_id", :force => true do |t|
    t.float   "or_food_buzz_avg", :limit => 4, :default => 0.0, :null => false
    t.float   "or_service_avg",   :limit => 4, :default => 0.0, :null => false
    t.float   "or_decor_avg",     :limit => 4, :default => 0.0, :null => false
    t.float   "or_total_sum",     :limit => 4, :default => 0.0, :null => false
    t.integer "or_users_count",                                 :null => false
  end

  create_table "tc_people_choiece_est_name", :force => true do |t|
    t.string   "name",         :limit => 200, :null => false
    t.string   "cusine_name",  :limit => 200, :null => false
    t.string   "phone_number", :limit => 100, :null => false
    t.string   "address",      :limit => 200, :null => false
    t.string   "city_name",    :limit => 100, :null => false
    t.string   "descript",     :limit => 200, :null => false
    t.string   "ip",           :limit => 100, :null => false
    t.datetime "insertdate",                  :null => false
    t.integer  "status",       :limit => 1,   :null => false
  end

  create_table "tc_poll_results", :force => true do |t|
    t.string   "polloptions_option",                :null => false
    t.integer  "pollquestion_id",                   :null => false
    t.integer  "userid",                            :null => false
    t.string   "username",                          :null => false
    t.string   "address",            :limit => 500, :null => false
    t.string   "phoneno",            :limit => 100, :null => false
    t.string   "email",                             :null => false
    t.datetime "insertdate",                        :null => false
    t.string   "IP",                                :null => false
    t.string   "status",             :limit => 7,   :null => false
  end

  create_table "tc_polloptions", :force => true do |t|
    t.string  "optiontext",                   :null => false
    t.integer "pollquestion_id",              :null => false
    t.string  "status",          :limit => 7, :null => false
  end

  create_table "tc_pollquestion", :primary_key => "poll_id", :force => true do |t|
    t.string   "poll_headline",               :null => false
    t.string   "poll_contypeid",              :null => false
    t.datetime "poll_startdate",              :null => false
    t.datetime "poll_enddate",                :null => false
    t.datetime "insertdate",                  :null => false
    t.datetime "updatedate",                  :null => false
    t.string   "publish",        :limit => 7, :null => false
  end

  add_index "tc_pollquestion", ["publish"], :name => "publish"

  create_table "tc_review_reports", :force => true do |t|
    t.integer  "review_id",        :limit => 8,                    :null => false
    t.integer  "reporter_id",      :limit => 8,                    :null => false
    t.boolean  "reason",                                           :null => false
    t.string   "reporter_comment", :limit => 250
    t.string   "status",           :limit => 1,   :default => "0", :null => false
    t.datetime "insertdate"
    t.datetime "resolved_date"
    t.datetime "resend_date"
    t.string   "ip",               :limit => 100
  end

  create_table "tc_review_reports_log", :force => true do |t|
    t.integer  "review_id",      :limit => 8
    t.integer  "modifyBy",       :limit => 8
    t.string   "modifyUserName", :limit => 50
    t.datetime "modifyDate"
    t.string   "comment",        :limit => 250
    t.string   "deleted_images", :limit => 200
    t.string   "action",         :limit => 1
    t.string   "resend_flag",    :limit => 1,   :default => "0"
    t.integer  "live_action",    :limit => 1
    t.string   "module_name",    :limit => 50
  end

  create_table "tc_reviews_rating", :primary_key => "rev_id", :force => true do |t|
    t.integer  "rev_user_id",           :limit => 8,                            :null => false
    t.string   "rev_user_name",                                                 :null => false
    t.string   "rev_user_email"
    t.integer  "rev_est_id",            :limit => 8,                            :null => false
    t.string   "rev_estname"
    t.integer  "rev_estcityid"
    t.boolean  "rev_est_whichtypeid"
    t.string   "rev_title",                                                     :null => false
    t.text     "rev_desc",              :limit => 2147483647,                   :null => false
    t.text     "rev_tags"
    t.string   "rev_suggestdish_id"
    t.string   "rev_suggestdish_names"
    t.float    "rev_avg_cnt",                                                   :null => false
    t.float    "rev_rate_1",                                                    :null => false
    t.float    "rev_rate_2",                                                    :null => false
    t.float    "rev_rate_3",                                                    :null => false
    t.integer  "rev_agree_cnt",         :limit => 8,          :default => 0,    :null => false
    t.integer  "rev_dont_agree_cnt",    :limit => 8,          :default => 0,    :null => false
    t.integer  "rev_report_cnt",        :limit => 8,          :default => 0,    :null => false
    t.integer  "rev_report_status",     :limit => 8,          :default => 0,    :null => false
    t.integer  "reply",                 :limit => 8,          :default => 0,    :null => false
    t.boolean  "flag",                                        :default => true, :null => false
    t.datetime "insertdate",                                                    :null => false
    t.datetime "modifyDate",                                                    :null => false
    t.integer  "status",                :limit => 1,                            :null => false
    t.string   "IP",                    :limit => 20,                           :null => false
    t.integer  "type",                  :limit => 1,          :default => 1,    :null => false
  end

  add_index "tc_reviews_rating", ["rev_est_id", "status"], :name => "IndEstStatus"
  add_index "tc_reviews_rating", ["rev_user_id", "rev_est_id", "rev_estcityid", "rev_est_whichtypeid"], :name => "NewIndex1"

  create_table "tc_section", :force => true do |t|
    t.integer  "sectionId",                  :default => 0
    t.string   "sectionName", :limit => 500
    t.integer  "estId",       :limit => 8
    t.string   "estName",     :limit => 500
    t.string   "estURL",      :limit => 500
    t.integer  "priority"
    t.integer  "cityId"
    t.boolean  "pageType"
    t.boolean  "status",                     :default => true
    t.integer  "authorId"
    t.datetime "insertDate"
    t.datetime "modifyDate"
  end

  create_table "tc_service_master", :primary_key => "service_id", :force => true do |t|
    t.string   "service_name",                :null => false
    t.datetime "insert_date",                 :null => false
    t.boolean  "status",                      :null => false
    t.string   "IP",           :limit => 25,  :null => false
    t.string   "thumbnail",    :limit => 200
  end

  create_table "tc_share", :primary_key => "share_id", :force => true do |t|
    t.integer  "share_user_id",      :limit => 8,                    :null => false
    t.string   "share_user_name",                                    :null => false
    t.integer  "share_est_id",       :limit => 8,                    :null => false
    t.string   "share_est_name",                                     :null => false
    t.integer  "share_rev_id",       :limit => 8,                    :null => false
    t.string   "share_rev_title",                                    :null => false
    t.string   "share_my_name",                                      :null => false
    t.string   "share_my_email",                                     :null => false
    t.string   "share_friend_email",                                 :null => false
    t.text     "share_message",                                      :null => false
    t.string   "share_link",                                         :null => false
    t.boolean  "share_from",                       :default => true, :null => false
    t.datetime "insertdate",                                         :null => false
    t.integer  "status",             :limit => 1,                    :null => false
    t.string   "IP",                 :limit => 15,                   :null => false
  end

  add_index "tc_share", ["share_est_id"], :name => "share_est_id"

  create_table "tc_slugs", :primary_key => "slug_id", :force => true do |t|
    t.integer  "slug_city_id",         :limit => 8,                                          :null => false
    t.integer  "slug_zone_id",                                                               :null => false
    t.integer  "slug_locality_id",                                                           :null => false
    t.integer  "slug_est_id",          :limit => 8,                                          :null => false
    t.string   "slug_image",                                                                 :null => false
    t.string   "slug_text",                                                                  :null => false
    t.string   "slug_url",                                                                   :null => false
    t.integer  "slug_index",                          :default => -1,                        :null => false
    t.integer  "slug_rest_section",                   :default => -1,                        :null => false
    t.integer  "slug_bar_section",                    :default => -1,                        :null => false
    t.integer  "slug_est_details",                    :default => -1,                        :null => false
    t.integer  "slug_serach",                         :default => -1,                        :null => false
    t.integer  "slug_event",                          :default => -1,                        :null => false
    t.integer  "slug_event_details",                  :default => -1,                        :null => false
    t.integer  "slug_event_search",                   :default => -1,                        :null => false
    t.integer  "slug_movie",                          :default => -1,                        :null => false
    t.integer  "slug_movie_details",                  :default => -1,                        :null => false
    t.integer  "slug_movie_search",                   :default => -1,                        :null => false
    t.integer  "slug_theatre_details",                :default => -1,                        :null => false
    t.datetime "slug_startdate",                                                             :null => false
    t.datetime "slug_enddate",                                                               :null => false
    t.string   "slug_imgcnt",          :limit => 500, :default => "0|0|0|0|0|0|0|0|0|0|0|0", :null => false
    t.integer  "priority",                            :default => 0,                         :null => false
    t.integer  "autopriority",                        :default => 0,                         :null => false
    t.boolean  "is_featured",                         :default => false,                     :null => false
    t.string   "slug_textcnt",         :limit => 500, :default => "0|0|0|0|0|0|0|0|0|0|0|0", :null => false
    t.string   "slug_clickcnt",        :limit => 500, :default => "0|0|0|0|0|0|0|0|0|0|0|0", :null => false
    t.integer  "parent",               :limit => 8,   :default => 0,                         :null => false
    t.boolean  "slug_targetLoc",                      :default => false,                     :null => false
    t.datetime "insertdate",                                                                 :null => false
    t.boolean  "status",                              :default => true,                      :null => false
  end

  add_index "tc_slugs", ["status", "slug_city_id", "is_featured"], :name => "ind_slug_sta_city_feat"

  create_table "tc_slugs_dummy", :primary_key => "slug_id", :force => true do |t|
    t.integer  "slug_city_id",      :limit => 8,                            :null => false
    t.integer  "slug_zone_id",                                              :null => false
    t.integer  "slug_locality_id",                                          :null => false
    t.integer  "slug_est_id",       :limit => 8,                            :null => false
    t.string   "slug_image",                                                :null => false
    t.string   "slug_text",                                                 :null => false
    t.string   "slug_url",                                                  :null => false
    t.integer  "slug_index",                       :default => -1,          :null => false
    t.integer  "slug_rest_section",                :default => -1,          :null => false
    t.integer  "slug_bar_section",                 :default => -1,          :null => false
    t.integer  "slug_serach",                      :default => -1,          :null => false
    t.integer  "slug_event",                       :default => -1,          :null => false
    t.datetime "slug_startdate",                                            :null => false
    t.datetime "slug_enddate",                                              :null => false
    t.string   "slug_imgcnt",       :limit => 500, :default => "0|0|0|0|0", :null => false
    t.integer  "priority",                         :default => 0,           :null => false
    t.integer  "autopriority",                     :default => 0,           :null => false
    t.boolean  "is_featured",                      :default => false,       :null => false
    t.string   "slug_textcnt",      :limit => 500, :default => "0|0|0|0|0", :null => false
    t.integer  "parent",            :limit => 8,   :default => 0,           :null => false
    t.boolean  "slug_targetLoc",                   :default => false,       :null => false
    t.datetime "insertdate",                                                :null => false
    t.boolean  "status",                           :default => true,        :null => false
  end

  create_table "tc_slugs_dummy1", :primary_key => "slug_id", :force => true do |t|
    t.float    "slug_city_id"
    t.float    "slug_zone_id"
    t.float    "slug_locality_id"
    t.float    "slug_est_id"
    t.string   "slug_image",        :limit => 765
    t.string   "slug_text",         :limit => 765
    t.string   "slug_url",          :limit => 765
    t.boolean  "slug_index"
    t.boolean  "slug_rest_section"
    t.boolean  "slug_bar_section"
    t.boolean  "slug_serach"
    t.boolean  "slug_event"
    t.datetime "slug_startdate"
    t.datetime "slug_enddate"
    t.float    "slug_imgcnt"
    t.float    "priority"
    t.integer  "autohomepriority",                 :default => 0, :null => false
    t.integer  "autorhomepriority",                :default => 0, :null => false
    t.integer  "autobhomepriority",                :default => 0, :null => false
    t.integer  "autosrppriority",                  :default => 0, :null => false
    t.integer  "autoevepriority",                  :default => 0, :null => false
    t.boolean  "is_featured"
    t.float    "slug_textcnt"
    t.datetime "insertdate"
    t.boolean  "status"
  end

  create_table "tc_slugs_dummy_old", :primary_key => "slug_id", :force => true do |t|
    t.float    "slug_city_id"
    t.float    "slug_zone_id"
    t.float    "slug_locality_id"
    t.float    "slug_est_id"
    t.string   "slug_image",        :limit => 765
    t.string   "slug_text",         :limit => 765
    t.string   "slug_url",          :limit => 765
    t.boolean  "slug_index"
    t.boolean  "slug_rest_section"
    t.boolean  "slug_bar_section"
    t.boolean  "slug_serach"
    t.boolean  "slug_event"
    t.datetime "slug_startdate"
    t.datetime "slug_enddate"
    t.float    "slug_imgcnt"
    t.float    "priority"
    t.integer  "autopriority",                     :default => 0, :null => false
    t.boolean  "is_featured"
    t.float    "slug_textcnt"
    t.datetime "insertdate"
    t.boolean  "status"
  end

  create_table "tc_solr_cron_indexing_stat", :id => false, :force => true do |t|
    t.integer  "start_est_id", :limit => 8, :null => false
    t.integer  "end_est_id",   :limit => 8, :null => false
    t.datetime "dump_time"
  end

  create_table "tc_solr_search_log", :force => true do |t|
    t.binary   "search_page",       :limit => 100,                :null => false
    t.string   "solr_search_query"
    t.datetime "insert_date"
    t.integer  "result_count",                     :default => 0
    t.string   "search_city",       :limit => 100
    t.string   "ip",                :limit => 25
  end

  create_table "tc_sponsor", :primary_key => "sponsor_id", :force => true do |t|
    t.integer  "est_id"
    t.string   "keyword_buy"
    t.string   "serialize_keyword_buy"
    t.string   "keyword_type",          :limit => 100
    t.integer  "no_of_times_displayed",                               :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "status",                               :default => 1
    t.integer  "city_id",                                             :null => false
    t.string   "city_name"
    t.integer  "is_featured",           :limit => 1,                  :null => false
    t.integer  "zone_id",                                             :null => false
    t.integer  "locality_id",                                         :null => false
    t.integer  "est_type_id",                                         :null => false
  end

  create_table "tc_state", :primary_key => "state_id", :force => true do |t|
    t.string   "state_name",                 :null => false
    t.string   "state_alias", :limit => 100, :null => false
    t.datetime "insertdate",                 :null => false
    t.integer  "status",      :limit => 1,   :null => false
    t.string   "IP",          :limit => 100, :null => false
  end

  create_table "tc_suggested_dishes", :primary_key => "suggestdish_id", :force => true do |t|
    t.integer "suggestdish_est_id",    :limit => 8,                     :null => false
    t.integer "suggestdish_user_id",   :limit => 8,                     :null => false
    t.string  "suggestdish_user_name",                                  :null => false
    t.integer "suggestdish_review_id", :limit => 8, :default => 0,      :null => false
    t.integer "suggestdish_dish_id",   :limit => 8,                     :null => false
    t.string  "suggestdish_dis_name",                                   :null => false
    t.string  "suggestdish_dish_type", :limit => 5, :default => "dish"
    t.boolean "status",                             :default => true
  end

  add_index "tc_suggested_dishes", ["suggestdish_dish_id", "suggestdish_est_id"], :name => "suggestdish_dish_id"
  add_index "tc_suggested_dishes", ["suggestdish_est_id"], :name => "suggestdish_est_id"

  create_table "tc_tags", :force => true do |t|
    t.string    "name",   :limit => 250, :null => false
    t.text      "desc"
    t.timestamp "date",                  :null => false
    t.integer   "status", :limit => 1,   :null => false
  end

  add_index "tc_tags", ["id", "name"], :name => "IndTag"
  add_index "tc_tags", ["name"], :name => "name", :unique => true

  create_table "tc_telecom_api_log", :primary_key => "api_log_id", :force => true do |t|
    t.string    "ip_address",     :limit => 15, :null => false
    t.integer   "status_code",    :limit => 2,  :null => false
    t.string    "operation_type", :limit => 21, :null => false
    t.text      "api_data",                     :null => false
    t.timestamp "createdTime",                  :null => false
  end

  create_table "tc_theater_master", :primary_key => "iTheaterId", :force => true do |t|
    t.string   "cTheatername",                                  :null => false
    t.integer  "iCityId",                                       :null => false
    t.string   "cTheaterAdress",                                :null => false
    t.string   "cTheaterPhone",                                 :null => false
    t.string   "cGooglemapUrl",                                 :null => false
    t.string   "cFacility",                                     :null => false
    t.datetime "dInsertDatetime",                               :null => false
    t.integer  "iStatus",                                       :null => false
    t.string   "email",           :limit => 100,                :null => false
    t.string   "mobile",                                        :null => false
    t.string   "toll_no",         :limit => 200
    t.string   "website",         :limit => 100,                :null => false
    t.string   "facebooklink",    :limit => 100,                :null => false
    t.integer  "inMall",                         :default => 2
    t.integer  "noOfScreens"
    t.integer  "iZoneId",                                       :null => false
    t.integer  "iLocalityId",                                   :null => false
    t.string   "deleted_by",      :limit => 20
    t.datetime "deleted_date"
    t.string   "pincode",         :limit => 10
    t.string   "landmark",        :limit => 250
    t.string   "booking_number",                                :null => false
    t.string   "theater_guid"
  end

  add_index "tc_theater_master", ["iCityId", "iStatus"], :name => "iCityId"

  create_table "tc_timesawards", :primary_key => "ad_id", :force => true do |t|
    t.integer  "ad_est_id",    :limit => 8,                    :null => false
    t.integer  "ad_master_id",                                 :null => false
    t.boolean  "ad_winner",                 :default => false, :null => false
    t.boolean  "ad_type",                   :default => true,  :null => false
    t.boolean  "ad_city",                   :default => false, :null => false
    t.datetime "insertdate",                                   :null => false
  end

  add_index "tc_timesawards", ["ad_master_id"], :name => "aw_mast_main"

  create_table "tc_timesawards_hotel", :primary_key => "adh_id", :force => true do |t|
    t.integer "adh_est_id",                       :null => false
    t.integer "adh_master_id",                    :null => false
    t.boolean "adh_winner",    :default => false, :null => false
  end

  create_table "tc_timesawards_master", :primary_key => "ad_id", :force => true do |t|
    t.string   "ad_year",          :limit => 4,  :default => "2010", :null => false
    t.string   "ad_category_name", :limit => 50,                     :null => false
    t.integer  "ad_city_id",       :limit => 2,                      :null => false
    t.integer  "ad_est_type",      :limit => 1,  :default => 0,      :null => false
    t.string   "ad_est_locality",  :limit => 30,                     :null => false
    t.integer  "ad_priority",                    :default => 0,      :null => false
    t.string   "IP",               :limit => 30,                     :null => false
    t.integer  "status",           :limit => 1,  :default => 1,      :null => false
    t.datetime "insertdate",                                         :null => false
  end

  add_index "tc_timesawards_master", ["ad_city_id", "ad_est_type", "ad_year", "status"], :name => "aw_main"

  create_table "tc_timesawards_noida", :primary_key => "adn_id", :force => true do |t|
    t.integer "adn_est_id",    :null => false
    t.integer "adn_master_id", :null => false
  end

  create_table "tc_timesawards_standalone", :primary_key => "ads_id", :force => true do |t|
    t.integer "ads_est_id",                       :null => false
    t.integer "ads_master_id",                    :null => false
    t.boolean "ads_winner",    :default => false, :null => false
  end

  create_table "tc_tmp_reviews", :force => true do |t|
    t.integer  "est_id",      :limit => 8,                    :null => false
    t.integer  "type",        :limit => 1,  :default => 1,    :null => false
    t.boolean  "flag",                      :default => true, :null => false
    t.text     "data",                                        :null => false
    t.datetime "createdDate",                                 :null => false
    t.string   "ip",          :limit => 20,                   :null => false
  end

  create_table "tc_user_beenhere", :primary_key => "bh_id", :force => true do |t|
    t.integer  "bh_userid",           :limit => 8,                     :null => false
    t.string   "bh_username",                                          :null => false
    t.integer  "bh_estid",            :limit => 8,                     :null => false
    t.string   "bh_estname",                                           :null => false
    t.boolean  "bh_emailalert"
    t.string   "bh_emailid"
    t.boolean  "bh_mobilealert"
    t.string   "bh_mobileno",         :limit => 50
    t.boolean  "bh_new_review_alert"
    t.boolean  "bh_type",                           :default => true,  :null => false
    t.datetime "insertdate",                                           :null => false
    t.datetime "modifydate"
    t.integer  "status",              :limit => 1,                     :null => false
    t.string   "IP",                  :limit => 20,                    :null => false
    t.boolean  "bh_cfav",                           :default => false
    t.boolean  "bh_follow",                         :default => false
    t.string   "bh_activityType",     :limit => 1,  :default => "b",   :null => false
  end

  add_index "tc_user_beenhere", ["bh_estid", "bh_type", "status"], :name => "main_index"
  add_index "tc_user_beenhere", ["bh_userid"], :name => "user_index"

  create_table "tc_user_callnow", :primary_key => "callnow_id", :force => true do |t|
    t.integer  "callnow_userid",   :limit => 8,                    :null => false
    t.string   "callnow_username",                                 :null => false
    t.integer  "callnow_estid",    :limit => 8,                    :null => false
    t.string   "callnow_estname",                                  :null => false
    t.string   "callnow_to_pno",                                   :null => false
    t.string   "callnow_from_pno",                                 :null => false
    t.string   "callnow_order_id",                                 :null => false
    t.string   "callnow_call_id",                                  :null => false
    t.boolean  "callnow_fromtype",               :default => true, :null => false
    t.datetime "insertdate",                                       :null => false
    t.string   "IP",               :limit => 20,                   :null => false
    t.string   "status",           :limit => 8,                    :null => false
  end

  create_table "tc_user_flagaccuracy", :primary_key => "ffa_id", :force => true do |t|
    t.integer  "ffa_userid",       :limit => 8,                     :null => false
    t.string   "ffa_username",     :limit => 225,                   :null => false
    t.integer  "ffa_estid",        :limit => 8,                     :null => false
    t.string   "ffa_estname",      :limit => 225,                   :null => false
    t.integer  "ffa_reviewid",     :limit => 8,                     :null => false
    t.string   "ffa_reviewname",   :limit => 225,                   :null => false
    t.integer  "ffa_oops",         :limit => 1,                     :null => false
    t.string   "ffa_descritption", :limit => 225,                   :null => false
    t.integer  "is_map",           :limit => 1,   :default => 0
    t.boolean  "ffa_from",                        :default => true, :null => false
    t.datetime "insertdate",                                        :null => false
    t.integer  "status",           :limit => 1,                     :null => false
    t.string   "IP",               :limit => 20,                    :null => false
  end

  create_table "tc_user_sendtophone", :primary_key => "stp_id", :force => true do |t|
    t.integer  "stp_userid",     :limit => 8,                     :null => false
    t.string   "stp_username",                                    :null => false
    t.integer  "stp_estid",      :limit => 8,                     :null => false
    t.string   "stp_estname",                                     :null => false
    t.string   "stp_to_pno",                                      :null => false
    t.text     "stp_msgdetails",                                  :null => false
    t.string   "request_id",                                      :null => false
    t.boolean  "stp_type",                      :default => true, :null => false
    t.datetime "insertdate",                                      :null => false
    t.string   "IP",             :limit => 100,                   :null => false
    t.string   "status",         :limit => 8,                     :null => false
  end

  create_table "tc_users", :primary_key => "user_id", :force => true do |t|
    t.string   "user_title",                 :limit => 4,                                 :null => false
    t.string   "user_fname",                 :limit => 50,                                :null => false
    t.string   "user_lname",                 :limit => 50,                                :null => false
    t.string   "profileimage"
    t.string   "user_name",                  :limit => 100,                               :null => false
    t.string   "user_type",                  :limit => 10,       :default => "timescity", :null => false
    t.string   "user_password",                                                           :null => false
    t.string   "user_password_encrypted",    :limit => 100
    t.date     "user_dob",                                                                :null => false
    t.string   "user_gender",                :limit => 6,        :default => "male"
    t.string   "user_email",                 :limit => 100,                               :null => false
    t.string   "user_mobile_no",             :limit => 20,                                :null => false
    t.string   "user_phone_no",              :limit => 30,                                :null => false
    t.string   "user_add1",                  :limit => 150,                               :null => false
    t.string   "user_add2",                  :limit => 150,                               :null => false
    t.string   "user_landmark",              :limit => 100,                               :null => false
    t.string   "user_pin_code",              :limit => 20,                                :null => false
    t.integer  "user_loc_id",                :limit => 8,                                 :null => false
    t.integer  "user_zone_id",                                                            :null => false
    t.integer  "user_city_id",                                                            :null => false
    t.string   "user_city_name",             :limit => 70
    t.integer  "user_state_id",                                  :default => 0,           :null => false
    t.string   "user_state_name",            :limit => 100
    t.integer  "user_country_id",            :limit => 8,                                 :null => false
    t.string   "send_offers",                :limit => 3,        :default => "No",        :null => false
    t.string   "user_is_fb_user",            :limit => 10,                                :null => false
    t.integer  "user_fb_uid",                :limit => 8,                                 :null => false
    t.boolean  "user_is_activated",                              :default => false,       :null => false
    t.string   "user_validation_code",       :limit => 100,                               :null => false
    t.integer  "user_is_mob_valid",          :limit => 1,        :default => 0,           :null => false
    t.string   "user_mob_validation_code",   :limit => 100,                               :null => false
    t.string   "user_mob_request_id",        :limit => 100,                               :null => false
    t.string   "user_foodieness",            :limit => 50
    t.string   "user_food_type",             :limit => 50
    t.string   "user_alcohol",               :limit => 50
    t.string   "user_party",                 :limit => 50
    t.text     "user_free_time",             :limit => 16777215
    t.text     "register_page_referer",                                                   :null => false
    t.string   "created_by",                 :limit => 100,                               :null => false
    t.datetime "created_date",                                                            :null => false
    t.string   "modified_by",                :limit => 100,                               :null => false
    t.datetime "modified_date",                                                           :null => false
    t.string   "is_deleted",                 :limit => 3,        :default => "No",        :null => false
    t.boolean  "is_celebrity",                                   :default => false,       :null => false
    t.string   "indiatimes_activation_code", :limit => 200
    t.string   "ip_address",                 :limit => 15,                                :null => false
    t.integer  "profile_status",                                 :default => 2
    t.integer  "res_rev_count",                                  :default => 0
    t.integer  "bar_rev_count",                                  :default => 0
    t.integer  "event_cmt_count",                                :default => 0
    t.integer  "movie_rev_count",                                :default => 0
    t.integer  "est_fav_count",                                  :default => 0
    t.integer  "event_fav_count",                                :default => 0
    t.integer  "venue_fav_count",                                :default => 0,           :null => false
    t.integer  "movie_fav_count",                                :default => 0
    t.string   "fb_location",                :limit => 100
    t.boolean  "fb_publish",                                     :default => false
    t.text     "fb_likes"
    t.text     "fb_groups"
    t.boolean  "fb_publish_rate",                                :default => true
    t.boolean  "fb_publish_review",                              :default => true
    t.boolean  "fb_publish_fav",                                 :default => true
    t.boolean  "isUpdated",                                      :default => true,        :null => false
    t.integer  "theatre_fav_count",                              :default => 0
    t.datetime "lastlogin",                                                               :null => false
    t.datetime "lastpasschange",                                                          :null => false
  end

  add_index "tc_users", ["user_name"], :name => "NewIndex1"

  create_table "tc_venue", :force => true do |t|
    t.string   "venue_name",                                                  :null => false
    t.boolean  "venue_cat",                                :default => true,  :null => false
    t.integer  "city_id",                                                     :null => false
    t.integer  "zone_id",                                                     :null => false
    t.integer  "locality_id",                                                 :null => false
    t.string   "city_name",            :limit => 50
    t.string   "zone_name",            :limit => 50
    t.string   "locality_name",        :limit => 50
    t.string   "address1"
    t.string   "address2"
    t.string   "landmark"
    t.string   "phone",                :limit => 200
    t.string   "toll_no",              :limit => 200
    t.string   "mobile",               :limit => 200
    t.string   "gps",                  :limit => 50,                          :null => false
    t.string   "venue_brands",         :limit => 100,                         :null => false
    t.integer  "venue_mall",                               :default => 0,     :null => false
    t.integer  "venue_type",                                                  :null => false
    t.string   "venue_facility"
    t.integer  "venue_capacity",                           :default => 0,     :null => false
    t.text     "venue_desc",           :limit => 16777215
    t.string   "venue_contact_person"
    t.string   "venue_email"
    t.string   "venue_url",            :limit => 512
    t.string   "venue_fb_url",         :limit => 512
    t.string   "venue_seat_type",      :limit => 512
    t.text     "venue_tags",           :limit => 16777215
    t.string   "reservation_info",     :limit => 512
    t.text     "audi_vs_capcity",      :limit => 16777215
    t.time     "start_time"
    t.time     "end_time"
    t.string   "IP",                   :limit => 20,                          :null => false
    t.boolean  "venue_is_reccomended",                     :default => false, :null => false
    t.boolean  "status",                                   :default => true,  :null => false
    t.datetime "insert_date",                                                 :null => false
    t.boolean  "flag",                                     :default => false, :null => false
    t.string   "oldguid",              :limit => 512
    t.string   "guid",                 :limit => 512
    t.integer  "created_by",                               :default => 0,     :null => false
    t.integer  "modified_by",                              :default => 0,     :null => false
    t.datetime "modified_date"
    t.integer  "deleted_by"
    t.datetime "deleted_date"
    t.integer  "moderated_by",                             :default => 0,     :null => false
    t.integer  "moderation_status",                        :default => 0,     :null => false
    t.boolean  "video_flag",                               :default => false, :null => false
    t.boolean  "image_flag",                               :default => false, :null => false
    t.boolean  "is_editable",                              :default => true,  :null => false
    t.integer  "assigned_to",                              :default => 0,     :null => false
    t.text     "csv_remarks"
    t.boolean  "is_csv_upload",                            :default => false
    t.string   "tmp_venue_landline"
    t.string   "tmp_venue_mobile"
  end

  create_table "tc_venue_tmp", :force => true do |t|
    t.integer  "venue_id",                                                    :null => false
    t.string   "venue_name",                                                  :null => false
    t.boolean  "venue_cat",                                :default => true,  :null => false
    t.integer  "city_id",                                                     :null => false
    t.integer  "zone_id",                                                     :null => false
    t.integer  "locality_id",                                                 :null => false
    t.string   "city_name",            :limit => 50
    t.string   "zone_name",            :limit => 50
    t.string   "locality_name",        :limit => 50
    t.string   "address1"
    t.string   "address2"
    t.string   "landmark"
    t.string   "phone",                :limit => 200
    t.string   "toll_no",              :limit => 200
    t.string   "mobile",               :limit => 200
    t.string   "gps",                  :limit => 50,                          :null => false
    t.string   "venue_brands",         :limit => 100,                         :null => false
    t.integer  "venue_mall",                               :default => 0,     :null => false
    t.integer  "venue_type",                                                  :null => false
    t.string   "venue_facility"
    t.integer  "venue_capacity",                           :default => 0,     :null => false
    t.text     "venue_desc",           :limit => 16777215
    t.string   "venue_contact_person"
    t.string   "venue_email"
    t.string   "venue_url",            :limit => 512
    t.string   "venue_fb_url",         :limit => 512
    t.string   "venue_seat_type",      :limit => 512
    t.text     "venue_tags",           :limit => 16777215
    t.string   "reservation_info",     :limit => 512
    t.text     "audi_vs_capcity",      :limit => 16777215
    t.time     "start_time"
    t.time     "end_time"
    t.string   "IP",                   :limit => 20,                          :null => false
    t.boolean  "venue_is_reccomended",                     :default => false, :null => false
    t.boolean  "status",                                   :default => true,  :null => false
    t.datetime "insert_date",                                                 :null => false
    t.boolean  "flag",                                     :default => false, :null => false
    t.string   "guid",                 :limit => 512
    t.integer  "created_by",                               :default => 0,     :null => false
    t.integer  "modified_by",                              :default => 0,     :null => false
    t.datetime "modified_date"
    t.integer  "moderated_by",                             :default => 0,     :null => false
    t.integer  "moderation_status",                        :default => 0,     :null => false
    t.boolean  "video_flag",                               :default => false, :null => false
    t.boolean  "image_flag",                               :default => false, :null => false
    t.boolean  "is_editable",                              :default => true,  :null => false
    t.integer  "assigned_to",                                                 :null => false
    t.text     "last_remarks"
    t.boolean  "in_verification",                          :default => true,  :null => false
    t.string   "tmp_venue_landline"
    t.string   "tmp_venue_mobile"
  end

  create_table "tc_venue_types", :force => true do |t|
    t.string    "venue_type_name",                                  :null => false
    t.boolean   "status",                                           :null => false
    t.timestamp "insert_date",                                      :null => false
    t.boolean   "flag",                          :default => false, :null => false
    t.string    "IP",              :limit => 50,                    :null => false
  end

  create_table "tc_verification_process_est", :primary_key => "process_id", :force => true do |t|
    t.integer  "est_id",                                        :null => false
    t.integer  "forwarded_to",                                  :null => false
    t.string   "status",           :limit => 2, :default => "", :null => false
    t.datetime "assigned_date",                                 :null => false
    t.string   "est_proceed",      :limit => 2
    t.string   "is_mytask",        :limit => 2
    t.integer  "assigned_to",                                   :null => false
    t.datetime "est_proceed_date"
    t.text     "comments"
  end

  create_table "tc_verification_process_event", :primary_key => "process_id", :force => true do |t|
    t.integer  "event_id",                                        :null => false
    t.integer  "forwarded_to",                                    :null => false
    t.string   "status",             :limit => 2, :default => "", :null => false
    t.datetime "assigned_date",                                   :null => false
    t.string   "event_proceed",      :limit => 2
    t.string   "is_mytask",          :limit => 2
    t.integer  "assigned_to",                                     :null => false
    t.datetime "event_proceed_date"
    t.text     "comments"
  end

  create_table "tc_verification_process_venue", :primary_key => "process_id", :force => true do |t|
    t.integer  "venue_id",                                        :null => false
    t.integer  "forwarded_to",                                    :null => false
    t.string   "status",             :limit => 2, :default => "", :null => false
    t.datetime "assigned_date",                                   :null => false
    t.string   "venue_proceed",      :limit => 2
    t.string   "is_mytask",          :limit => 2
    t.integer  "assigned_to",                                     :null => false
    t.datetime "venue_proceed_date"
    t.text     "comments"
  end

  create_table "tc_zone", :primary_key => "zone_id", :force => true do |t|
    t.integer  "zone_city_id",                                   :null => false
    t.string   "zone_name",                                      :null => false
    t.integer  "restautant_count",                :default => 0
    t.integer  "nightlife_count",                 :default => 0
    t.datetime "insertdate",                                     :null => false
    t.integer  "status",           :limit => 1,                  :null => false
    t.string   "IP",               :limit => 100,                :null => false
  end

  add_index "tc_zone", ["zone_city_id"], :name => "NewIndex1"

  create_table "temp_log", :force => true do |t|
    t.string   "url"
    t.string   "ip"
    t.datetime "insertdate"
  end

  create_table "testa", :id => false, :force => true do |t|
    t.string "AuthorName", :limit => 225, :null => false
    t.string "UserName",   :limit => 225, :null => false
    t.string "Role",       :limit => 225, :null => false
  end

  create_table "theatermaster", :primary_key => "iTheaterId", :force => true do |t|
    t.string   "cTheatername",    :null => false
    t.integer  "iCityId",         :null => false
    t.string   "cTheaterAdress",  :null => false
    t.string   "cTheaterPhone",   :null => false
    t.string   "cGooglemapUrl",   :null => false
    t.string   "cFacility",       :null => false
    t.datetime "dInsertDatetime", :null => false
    t.integer  "iStatus",         :null => false
  end

  create_table "toi_widget", :primary_key => "toi_id", :force => true do |t|
    t.string  "toi_est_name"
    t.string  "toi_est_location"
    t.string  "toi_est_url",                         :null => false
    t.string  "toi_est_cuisine"
    t.float   "toi_est_ratings"
    t.boolean "toi_est_whichtype", :default => true
    t.integer "toi_est_city_id"
    t.boolean "status",            :default => true
  end

  create_table "toi_widget1", :primary_key => "toi_id", :force => true do |t|
    t.string  "toi_est_name"
    t.string  "toi_est_location"
    t.string  "toi_est_url",                         :null => false
    t.string  "toi_est_cuisine"
    t.float   "toi_est_ratings"
    t.boolean "toi_est_whichtype", :default => true
    t.integer "toi_est_city_id"
    t.boolean "status",            :default => true
  end

  create_table "toi_widgetold", :primary_key => "toi_id", :force => true do |t|
    t.string  "toi_est_name"
    t.string  "toi_est_location"
    t.string  "toi_est_url",                         :null => false
    t.string  "toi_est_cuisine"
    t.float   "toi_est_ratings"
    t.boolean "toi_est_whichtype", :default => true
    t.integer "toi_est_city_id"
    t.boolean "status",            :default => true
  end

  create_table "user_establishment_details", :force => true do |t|
    t.integer  "is_owner",                                     :null => false
    t.integer  "user_id",                                      :null => false
    t.string   "rest_name",                                    :null => false
    t.string   "cat_id",      :limit => 100
    t.integer  "city_id"
    t.integer  "locality_id"
    t.string   "address1",    :limit => 222
    t.string   "address2",    :limit => 222
    t.string   "landmark",    :limit => 222,                   :null => false
    t.string   "pincode",     :limit => 100,                   :null => false
    t.datetime "insert_date"
    t.integer  "IP",                                           :null => false
    t.boolean  "status",                     :default => true, :null => false
  end

  create_table "user_event_media", :primary_key => "media_id", :force => true do |t|
    t.string   "media_name",                                       :null => false
    t.integer  "user_event_id",                     :default => 0, :null => false
    t.integer  "user_id",            :limit => 8
    t.string   "est_media_username"
    t.datetime "insertdate",                                       :null => false
    t.integer  "status",             :limit => 1,   :default => 1, :null => false
    t.string   "IP",                 :limit => 100,                :null => false
  end

  create_table "user_events_details", :force => true do |t|
    t.integer  "is_owner",                                     :null => false
    t.integer  "user_id",                                      :null => false
    t.string   "event_name",                                   :null => false
    t.string   "venue_name",                                   :null => false
    t.string   "cat_id",      :limit => 100
    t.integer  "city_id"
    t.integer  "locality_id"
    t.string   "address1",    :limit => 222
    t.string   "address2",    :limit => 222
    t.string   "landmark",    :limit => 222,                   :null => false
    t.string   "pincode",     :limit => 100,                   :null => false
    t.datetime "insert_date"
    t.integer  "IP",                                           :null => false
    t.boolean  "status",                     :default => true, :null => false
  end

end
