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

ActiveRecord::Schema.define(version: 20160606080001) do

  create_table "klasses", force: true do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klasses", ["teacher_id"], name: "index_klasses_on_teacher_id"

  create_table "klasses_students", id: false, force: true do |t|
    t.integer "klass_id",   null: false
    t.integer "student_id", null: false
  end

  add_index "klasses_students", ["klass_id", "student_id"], name: "index_klasses_students_on_klass_id_and_student_id"
  add_index "klasses_students", ["student_id", "klass_id"], name: "index_klasses_students_on_student_id_and_klass_id"

  create_table "lesson_parts", force: true do |t|
    t.integer  "lesson_id"
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lesson_parts", ["lesson_id"], name: "index_lesson_parts_on_lesson_id"

  create_table "lesson_trackers", force: true do |t|
    t.integer  "lesson_id"
    t.datetime "completed_at"
    t.integer  "lesson_part_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lesson_trackers", ["lesson_id"], name: "index_lesson_trackers_on_lesson_id"
  add_index "lesson_trackers", ["lesson_part_id"], name: "index_lesson_trackers_on_lesson_part_id"
  add_index "lesson_trackers", ["student_id"], name: "index_lesson_trackers_on_student_id"

  create_table "lessons", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
