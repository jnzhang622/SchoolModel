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

ActiveRecord::Schema.define(version: 10) do

  create_table "floors", force: :cascade do |t|
    t.string "flr"
    t.integer "shininess"
  end

  create_table "janitormops", force: :cascade do |t|
    t.integer "janitor_id"
    t.integer "mop_id"
  end

  create_table "janitors", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
  end

  create_table "mopfloors", force: :cascade do |t|
    t.integer "mop_id"
    t.integer "floor_id"
  end

  create_table "mops", force: :cascade do |t|
    t.string "brand"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
  end

  create_table "studentsubjects", force: :cascade do |t|
    t.integer "student_id"
    t.integer "subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
  end

end
