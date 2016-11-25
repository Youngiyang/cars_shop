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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161125022924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string   "img_url",                  null: false
    t.string   "link"
    t.text     "description", default: "", null: false
    t.integer  "position",                 null: false
    t.integer  "sort_order",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_albums_on_name", unique: true, using: :btree
  end

  create_table "attr_groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attr_options", force: :cascade do |t|
    t.integer  "attr_id",    null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attrs", force: :cascade do |t|
    t.integer  "attr_group_id", null: false
    t.string   "key",           null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "en_name"
    t.string   "cn_name",                     null: false
    t.string   "logo",                        null: false
    t.integer  "sort_order",                  null: false
    t.boolean  "is_show",     default: false, null: false
    t.string   "nationality", default: "",    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["cn_name"], name: "index_brands_on_cn_name", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "parent_id",   default: 0,  null: false
    t.text     "description", default: "", null: false
    t.integer  "sort_order",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "consultations", force: :cascade do |t|
    t.string   "intention",   null: false
    t.integer  "province_id", null: false
    t.integer  "city_id",     null: false
    t.string   "name",        null: false
    t.string   "phone_num",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "question",   null: false
    t.text     "answer",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "good_attr_options", force: :cascade do |t|
    t.integer  "good_id",        null: false
    t.integer  "attr_option_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "good_spec_options", force: :cascade do |t|
    t.integer  "good_id",        null: false
    t.integer  "spec_option_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer  "product_id",                                                 null: false
    t.string   "name",                                                       null: false
    t.string   "photo_ids"
    t.string   "content_photo_ids"
    t.string   "source_from",                                                null: false
    t.decimal  "current_price",     precision: 11, scale: 2
    t.decimal  "market_price",      precision: 11, scale: 2
    t.string   "registered_info",                                            null: false
    t.boolean  "in_stock",                                   default: false, null: false
    t.integer  "status",                                     default: 0,     null: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "order_consultations", force: :cascade do |t|
    t.string   "order_cn",    null: false
    t.integer  "user_id",     null: false
    t.string   "mobile",      null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_cn",                  null: false
    t.integer  "user_id",                   null: false
    t.integer  "good_id",                   null: false
    t.string   "name",                      null: false
    t.string   "phone_num",                 null: false
    t.integer  "province_id",               null: false
    t.integer  "city_id",                   null: false
    t.text     "requirements", default: "", null: false
    t.integer  "status",       default: 1,  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "album_id",   null: false
    t.string   "name",       null: false
    t.string   "img_url",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_specs", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "spec_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                                                       null: false
    t.integer  "brand_id",                                                   null: false
    t.integer  "category_id",                                                null: false
    t.integer  "photo_id",                                                   null: false
    t.string   "slogan",                                                     null: false
    t.decimal  "min_price",         precision: 11, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "img_url"
    t.boolean  "is_hot",                                     default: false, null: false
    t.boolean  "is_recommended",                             default: false, null: false
    t.string   "recommended_words"
    t.index ["name"], name: "index_products_on_name", unique: true, using: :btree
  end

  create_table "spec_options", force: :cascade do |t|
    t.integer  "spec_id",    null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spec_id", "value"], name: "index_spec_options_on_spec_id_and_value", unique: true, using: :btree
  end

  create_table "specs", force: :cascade do |t|
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_specs_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "mobile",          null: false
    t.string   "password_digest", null: false
    t.string   "user_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
  end

end
