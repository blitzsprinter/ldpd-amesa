# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_08_195851) do

  create_table "countries", force: :cascade do |t|
    t.string "name_eng"
    t.string "name_fra"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name_eng"
    t.string "name_fra"
    t.string "url_formatted_name"
  end

  create_table "scholars", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "region_id"
    t.integer "country_id"
    t.string "title"
    t.string "affiliation"
    t.string "email"
    t.text "mailing_address"
    t.text "phone_fax_numbers"
    t.string "website"
    t.text "countries_of_specialization"
    t.text "education"
    t.text "research_interests"
    t.text "teaching_interests"
    t.text "publications"
    t.string "keywords"
    t.text "optional_message"
    t.text "warning"
    t.string "submitter_email"
    t.boolean "approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_scholars_on_country_id"
    t.index ["first_name"], name: "index_scholars_on_first_name"
    t.index ["last_name"], name: "index_scholars_on_last_name"
    t.index ["region_id"], name: "index_scholars_on_region_id"
  end

end
