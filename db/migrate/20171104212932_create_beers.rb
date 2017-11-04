class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :Sales_Order_Number
      t.string :Variant_SKU
      t.string :Item_Product
      t.string :Item_Name
      t.string :Item_Label
      t.string :Item_UPC
      t.float :Item_Quantity
      t.float :Item_Price
      t.integer :Item_Discount_Percentage
      t.float :Item_Discounted_Price
      t.integer :Item_Tax_Rate
      t.integer :Item_Position
      t.datetime :Packed_Date
      t.datetime :Shipped_Date
      t.string :Currency
      t.string :Warehouse
      t.string :Assignee
      t.string :Fulfillment_Notes
      t.string :Email
      t.string :Contact_Name
      t.string :Company_Name
      t.string :Company_Code
      t.string :Company_Tax_Number
      t.string :Company_Fax
      t.string :Shipping_Address_Name
      t.string :Shipping_Address_Company_Name
      t.string :Shipping_Address_Line_1
      t.string :Shipping_Address_Line_2
      t.string :Shipping_Address_Suburb
      t.string :Shipping_Address_City
      t.string :Shipping_Address_State
      t.string :Shipping_Address_Country
      t.string :Shipping_Address_Zip_Code
      t.string :Shipping_Address_Email
      t.string :Shipping_Address_Phone_Number
      t.string :Billing_Address_Name
      t.string :Billing_Address_Company_Name
      t.string :Billing_Address_Line_1
      t.string :Billing_Address_Line_2
      t.string :Billing_Address_Suburb
      t.string :Billing_Address_City
      t.string :Billing_Address_State
      t.string :Billing_Address_Country
      t.string :Billing_Address_Zip_Code
      t.string :Billing_Address_Email
      t.string :Billing_Address_Phone_Number
      t.string :Order_Reference

      t.timestamps
    end
  end
end
