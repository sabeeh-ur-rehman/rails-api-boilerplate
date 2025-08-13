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

ActiveRecord::Schema[7.0].define(version: 2024_07_01_005000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "oauth_access_tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "resource_owner_type"
    t.uuid "resource_owner_id"
    t.uuid "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_type", "resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri"
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdomain"], name: "index_accounts_on_subdomain", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "account_id", null: false
    t.integer "role", default: 0, null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "leads", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "rep_id", null: false
    t.string "project_name", null: false
    t.string "job_type", null: false
    t.string "spa_type", null: false
    t.boolean "vanishing_edge", default: false, null: false
    t.date "client_request_date", null: false
    t.string "site_address", null: false
    t.string "customer_name", null: false
    t.string "customer_phone", null: false
    t.string "customer_email", null: false
    t.string "council", null: false
    t.integer "customer_no", null: false
    t.integer "job_no", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "customer_no"], name: "index_leads_on_account_id_and_customer_no", unique: true
    t.index ["account_id", "job_no"], name: "index_leads_on_account_id_and_job_no", unique: true
  end

  create_table "proposals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "lead_id", null: false
    t.integer "issue_number", default: 1, null: false
    t.string "status", default: "draft", null: false
    t.string "adjustment_type", default: "none", null: false
    t.decimal "adjustment_percentage", precision: 5, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_proposals_on_account_id"
    t.index ["lead_id", "issue_number"], name: "index_proposals_on_lead_id_and_issue_number", unique: true
    t.index ["lead_id"], name: "index_proposals_on_lead_id"
  end

  create_table "proposal_sections", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "proposal_id", null: false
    t.string "title", null: false
    t.integer "position"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_proposal_sections_on_account_id"
    t.index ["proposal_id"], name: "index_proposal_sections_on_proposal_id"
  end

  create_table "proposal_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "proposal_section_id", null: false
    t.string "item_code"
    t.text "description", null: false
    t.decimal "quantity", precision: 10, scale: 2, default: "1.0", null: false
    t.decimal "unit_price", precision: 10, scale: 2, default: "0.0", null: false
    t.boolean "optional", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_proposal_items_on_account_id"
    t.index ["proposal_section_id"], name: "index_proposal_items_on_proposal_section_id"
  end

  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "users", "accounts"
  add_foreign_key "leads", "accounts"
  add_foreign_key "leads", "users", column: "rep_id"
  add_foreign_key "proposals", "accounts"
  add_foreign_key "proposals", "leads"
  add_foreign_key "proposal_sections", "accounts"
  add_foreign_key "proposal_sections", "proposals"
  add_foreign_key "proposal_items", "accounts"
  add_foreign_key "proposal_items", "proposal_sections"
end
