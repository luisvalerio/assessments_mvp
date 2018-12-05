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

ActiveRecord::Schema.define(version: 2018_12_05_005037) do

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "survey_submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_submission_id"], name: "index_answers_on_survey_submission_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_text"
    t.integer "survey_template_id"
    t.integer "time_in_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_template_id"], name: "index_questions_on_survey_template_id"
  end

  create_table "survey_submissions", force: :cascade do |t|
    t.string "email"
    t.integer "survey_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_template_id"], name: "index_survey_submissions_on_survey_template_id"
  end

  create_table "survey_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
