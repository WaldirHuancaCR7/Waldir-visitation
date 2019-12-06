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

ActiveRecord::Schema.define(version: 2019_11_24_011419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "catalogue_locations", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "catalogue_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "derivations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "derivations_polls", id: false, force: :cascade do |t|
    t.bigint "derivation_id", null: false
    t.bigint "poll_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "dni"
    t.string "phone"
    t.integer "person_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id"
    t.bigint "province_id"
    t.bigint "district_id"
    t.index ["department_id"], name: "index_people_on_department_id"
    t.index ["district_id"], name: "index_people_on_district_id"
    t.index ["province_id"], name: "index_people_on_province_id"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "poll_derivations", force: :cascade do |t|
    t.bigint "derivation_id", null: false
    t.bigint "poll_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["derivation_id"], name: "index_poll_derivations_on_derivation_id"
    t.index ["poll_id"], name: "index_poll_derivations_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.bigint "visit_id", null: false
    t.text "academic_aspect"
    t.text "psychological_aspect"
    t.text "health_aspect"
    t.text "economic_aspect"
    t.text "spiritual_aspect"
    t.string "evidence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "others"
    t.index ["visit_id"], name: "index_polls_on_visit_id"
  end

  create_table "professional_schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "religions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "religious_afilliations", force: :cascade do |t|
    t.bigint "religion_id", null: false
    t.string "church"
    t.string "sabbath_school_class"
    t.string "baptized"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["religion_id"], name: "index_religious_afilliations_on_religion_id"
  end

  create_table "responsible_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "responsibles", force: :cascade do |t|
    t.string "name"
    t.bigint "responsible_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id"
    t.index ["responsible_type_id"], name: "index_responsibles_on_responsible_type_id"
    t.index ["student_id"], name: "index_responsibles_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "code"
    t.bigint "person_id", null: false
    t.bigint "professional_school_id", null: false
    t.bigint "study_cycle_id", null: false
    t.bigint "study_group_id", null: false
    t.bigint "religion_id", null: false
    t.string "address"
    t.string "reference"
    t.integer "student_type"
    t.boolean "urgent"
    t.string "lat"
    t.string "lng"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "church"
    t.string "sabbath_school_class"
    t.boolean "baptized"
    t.string "church_adresss"
    t.index ["person_id"], name: "index_students_on_person_id"
    t.index ["professional_school_id"], name: "index_students_on_professional_school_id"
    t.index ["religion_id"], name: "index_students_on_religion_id"
    t.index ["study_cycle_id"], name: "index_students_on_study_cycle_id"
    t.index ["study_group_id"], name: "index_students_on_study_group_id"
  end

  create_table "study_cycles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "study_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_type"
    t.boolean "active"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.datetime "visit_date"
    t.datetime "closing_date"
    t.integer "status"
    t.datetime "scheduled_date"
    t.datetime "visit_date_finished"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "folio"
    t.bigint "user_id"
    t.index ["student_id"], name: "index_visits_on_student_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "people", "catalogue_locations", column: "department_id"
  add_foreign_key "people", "catalogue_locations", column: "district_id"
  add_foreign_key "people", "catalogue_locations", column: "province_id"
  add_foreign_key "people", "users"
  add_foreign_key "poll_derivations", "derivations"
  add_foreign_key "poll_derivations", "polls"
  add_foreign_key "polls", "visits"
  add_foreign_key "religious_afilliations", "religions"
  add_foreign_key "responsibles", "responsible_types"
  add_foreign_key "responsibles", "students"
  add_foreign_key "students", "people"
  add_foreign_key "students", "professional_schools"
  add_foreign_key "students", "religions"
  add_foreign_key "students", "study_cycles"
  add_foreign_key "students", "study_groups"
  add_foreign_key "visits", "students"
  add_foreign_key "visits", "users"
end
