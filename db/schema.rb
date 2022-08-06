ActiveRecord::Schema[7.0].define(version: 2021_12_09_151243) do
  enable_extension "plpgsql"

  create_table "todos", force: :cascade do |t|
    t.string "todo_text"
    t.date "due_date"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
