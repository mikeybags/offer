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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170401191251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "employee_responses", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "question_id"
    t.text     "answer"
    t.boolean  "correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employee_responses", ["employee_id"], name: "index_employee_responses_on_employee_id", using: :btree
  add_index "employee_responses", ["question_id"], name: "index_employee_responses_on_question_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "birthday"
    t.text     "skills",              default: [],              array: true
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "company_environment", default: [],              array: true
    t.text     "job_characteristics", default: [],              array: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.string   "yearly_revenue"
    t.integer  "employee_count"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "company_environment", default: [],              array: true
    t.text     "job_characteristics", default: [],              array: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postings", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "qualifications",      default: [],              array: true
    t.text     "responsibilities",    default: [],              array: true
    t.string   "job_type"
    t.string   "required_education"
    t.string   "required_experience"
    t.string   "job_characteristics"
    t.integer  "industry_id"
    t.integer  "employer_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "postings", ["employer_id"], name: "index_postings_on_employer_id", using: :btree
  add_index "postings", ["industry_id"], name: "index_postings_on_industry_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "industry_id"
    t.text     "question"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["industry_id"], name: "index_questions_on_industry_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "employee_responses", "employees"
  add_foreign_key "employee_responses", "questions"
  add_foreign_key "postings", "employers"
  add_foreign_key "postings", "industries"
  add_foreign_key "questions", "industries"
end
