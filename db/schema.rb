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

ActiveRecord::Schema.define(version: 2019_10_03_194151) do

  create_table "scholars", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "region_of_study"
    t.string "primary_country_of_residence"
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
    t.string "submitter_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
