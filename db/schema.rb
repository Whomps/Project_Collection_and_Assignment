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

ActiveRecord::Schema.define(version: 20180428170010) do

  create_table "assignments", force: :cascade do |t|
    t.integer "team_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_assignments_on_project_id"
    t.index ["team_id"], name: "index_assignments_on_team_id"
  end

  create_table "documents", force: :cascade do |t|
    t.boolean "is_legacy"
    t.boolean "is_file"
    t.string "name"
    t.string "doc_type"
    t.integer "project_id"
    t.datetime "date"
    t.string "author"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "filein"
  end

  create_table "owns", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.index ["project_id"], name: "index_owns_on_project_id"
    t.index ["user_id", "project_id"], name: "index_owns_on_user_id_and_project_id", unique: true
    t.index ["user_id"], name: "index_owns_on_user_id"
  end

  create_table "preassignments", force: :cascade do |t|
    t.integer "team_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "team_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value"
    t.index ["project_id"], name: "index_preferences_on_project_id"
    t.index ["team_id", "project_id"], name: "index_preferences_on_team_id_and_project_id", unique: true
    t.index ["team_id"], name: "index_preferences_on_team_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "organization"
    t.text "contact"
    t.text "description"
    t.boolean "oncampus"
    t.boolean "islegacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
    t.string "semester"
    t.integer "legacy_id"
    t.string "year"
    t.text "github_link"
    t.text "pivotal_link"
    t.text "heroku_link"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_relationships_on_team_id"
    t.index ["user_id", "team_id"], name: "index_relationships_on_user_id_and_team_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.index ["name"], name: "index_teams_on_name", unique: true
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uin"
    t.string "email"
    t.string "year"
    t.string "semester"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.text "peer_evaluation"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
