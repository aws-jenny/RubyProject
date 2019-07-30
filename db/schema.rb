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

ActiveRecord::Schema.define(version: 20190729072344) do

  create_table "associations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "certificate_id"
    t.integer "associate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.decimal "exam_fee", precision: 10
    t.boolean "isReimbursable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "examinee_code"
    t.date "exam_date"
    t.bigint "user_certificate_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_certificate_record_id"], name: "index_exam_histories_on_user_certificate_record_id"
  end

  create_table "recommendations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "certificate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_recommendations_on_certificate_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "trainings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.text "source"
    t.text "importance"
    t.bigint "certificate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_trainings_on_certificate_id"
  end

  create_table "user_certificate_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "certificate_id"
    t.string "status", default: "Wished", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_user_certificate_records_on_certificate_id"
    t.index ["user_id"], name: "index_user_certificate_records_on_user_id"
  end

  create_table "user_training_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "isDone"
    t.bigint "user_id"
    t.bigint "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_user_training_records_on_training_id"
    t.index ["user_id"], name: "index_user_training_records_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", default: "", null: false
    t.string "middle_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.boolean "isAdmin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exam_histories", "user_certificate_records"
  add_foreign_key "recommendations", "certificates"
  add_foreign_key "recommendations", "users"
  add_foreign_key "trainings", "certificates"
  add_foreign_key "user_certificate_records", "certificates"
  add_foreign_key "user_certificate_records", "users"
  add_foreign_key "user_training_records", "trainings"
  add_foreign_key "user_training_records", "users"
end
