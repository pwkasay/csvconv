class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :order_number
      t.string :sku
      t.string :item_product
      t.string :item_label
      t.string :ite_upc
      t.float :item_quantity
      t.float :item_price
      t.integer :discount_percentage
      t.integer :tax_rate
      t.integer :item_position
      t.datetime :packed_date
      t.datetime :shipped_date
      t.string :currency
      t.string :warehouse
      t.string :assignee
      t.string :notes
      t.string :email
      t.string :contact_name
      t.string :company_name
      t.string :company_code
      t.string :tax_number
      t.string :fax
      t.string :shipping_address_name
      t.string :shipping_address_company_name
      t.string :shipping_address_line_1
      t.string :shipping_address_line_2
      t.string :shipping_address_suburb
      t.string :shipping_address_city
      t.string :shipping_address_state
      t.string :shipping_address_country
      t.string :shipping_address_zipcode
      t.string :shipping_address_email
      t.string :shipping_address_phone_number
      t.string :billing_address_name
      t.string :billing_address_company_name
      t.string :billing_address_line_1
      t.string :billing_address_line_2
      t.string :billing_address_suburb
      t.string :billing_address_city
      t.string :billing_address_state
      t.string :billing_address_country
      t.string :billing_address_zipcode
      t.string :billing_address_email
      t.string :billing_address_phone_number
      t.string :order_reference

      t.timestamps
    end
  end
end
