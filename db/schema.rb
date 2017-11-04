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

ActiveRecord::Schema.define(version: 20171104203930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "order_number"
    t.string "sku"
    t.string "item_product"
    t.string "item_label"
    t.string "ite_upc"
    t.float "item_quantity"
    t.float "item_price"
    t.integer "discount_percentage"
    t.integer "tax_rate"
    t.integer "item_position"
    t.datetime "packed_date"
    t.datetime "shipped_date"
    t.string "currency"
    t.string "warehouse"
    t.string "assignee"
    t.string "notes"
    t.string "email"
    t.string "contact_name"
    t.string "company_name"
    t.string "company_code"
    t.string "tax_number"
    t.string "fax"
    t.string "shipping_address_name"
    t.string "shipping_address_company_name"
    t.string "shipping_address_line_1"
    t.string "shipping_address_line_2"
    t.string "shipping_address_suburb"
    t.string "shipping_address_city"
    t.string "shipping_address_state"
    t.string "shipping_address_country"
    t.string "shipping_address_zipcode"
    t.string "shipping_address_email"
    t.string "shipping_address_phone_number"
    t.string "billing_address_name"
    t.string "billing_address_company_name"
    t.string "billing_address_line_1"
    t.string "billing_address_line_2"
    t.string "billing_address_suburb"
    t.string "billing_address_city"
    t.string "billing_address_state"
    t.string "billing_address_country"
    t.string "billing_address_zipcode"
    t.string "billing_address_email"
    t.string "billing_address_phone_number"
    t.string "order_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
