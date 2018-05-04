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

ActiveRecord::Schema.define(version: 20180501215003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.date "when"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "students_id", null: false
    t.string "reason"
    t.index ["students_id"], name: "index_absences_on_students_id"
  end

  create_table "classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "students_id", null: false
    t.bigint "subjects_id", null: false
    t.index ["students_id"], name: "index_grades_on_students_id"
    t.index ["subjects_id"], name: "index_grades_on_subjects_id"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "classes_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["classes_id"], name: "index_students_on_classes_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "difficulty"
    t.integer "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teachers_id", null: false
    t.bigint "classes_id", null: false
    t.index ["classes_id"], name: "index_teacher_classes_on_classes_id"
    t.index ["teachers_id"], name: "index_teacher_classes_on_teachers_id"
  end

  create_table "teacher_subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teachers_id", null: false
    t.bigint "subjects_id", null: false
    t.index ["subjects_id"], name: "index_teacher_subjects_on_subjects_id"
    t.index ["teachers_id"], name: "index_teacher_subjects_on_teachers_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.integer "credit_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  add_foreign_key "absences", "students", column: "students_id"
  add_foreign_key "grades", "students", column: "students_id"
  add_foreign_key "grades", "subjects", column: "subjects_id"
  add_foreign_key "students", "classes", column: "classes_id"
  add_foreign_key "teacher_classes", "classes", column: "classes_id"
  add_foreign_key "teacher_classes", "teachers", column: "teachers_id"
  add_foreign_key "teacher_subjects", "subjects", column: "subjects_id"
  add_foreign_key "teacher_subjects", "teachers", column: "teachers_id"
end
