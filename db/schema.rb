# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_07_155112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "contact_phone_number"
    t.string "contact_person_surname"
    t.string "actual_address"
    t.string "contact_e_mail"
    t.bigint "region_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_employers_on_region_id"
  end

  create_table "handbook_vacancies", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string "applicant_surname"
    t.string "name"
    t.string "middle_name"
    t.string "year_birth"
    t.string "gender"
    t.string "region_residence"
    t.string "address"
    t.string "applicant_education"
    t.string "phone"
    t.string "applicant_email"
    t.string "desired_work"
    t.string "desired_wage"
    t.string "profession_position"
    t.string "experience"
    t.string "proficiency_languages"
    t.string "presence_driver_license"
    t.bigint "user_id"
    t.bigint "region_id"
    t.bigint "handbook_vacancy_id"
    t.bigint "education_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["education_id"], name: "index_resumes_on_education_id"
    t.index ["handbook_vacancy_id"], name: "index_resumes_on_handbook_vacancy_id"
    t.index ["region_id"], name: "index_resumes_on_region_id"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phone_number"
    t.string "address"
    t.string "e_mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "name_profession"
    t.string "free_work_places"
    t.string "wage"
    t.string "applicant_education"
    t.string "workplace_address"
    t.string "experience"
    t.string "proficiency_languages"
    t.string "presence_driver_license"
    t.bigint "employer_id"
    t.bigint "handbook_vacancy_id"
    t.bigint "region_id"
    t.bigint "education_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["education_id"], name: "index_vacancies_on_education_id"
    t.index ["employer_id"], name: "index_vacancies_on_employer_id"
    t.index ["handbook_vacancy_id"], name: "index_vacancies_on_handbook_vacancy_id"
    t.index ["region_id"], name: "index_vacancies_on_region_id"
  end

  add_foreign_key "employers", "regions"
  add_foreign_key "resumes", "educations"
  add_foreign_key "resumes", "handbook_vacancies"
  add_foreign_key "resumes", "regions"
  add_foreign_key "resumes", "users"
  add_foreign_key "vacancies", "educations"
  add_foreign_key "vacancies", "employers"
  add_foreign_key "vacancies", "handbook_vacancies"
  add_foreign_key "vacancies", "regions"
end
