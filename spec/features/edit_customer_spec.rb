require "rails_helper"

feature "Edit Customer" do
	scenario "successfully" do
    
		insert_new_customer "Temp Mobile Number", "Temp Customer Name", "Temp Customer Address"
    visit customers_path
    
    click_on "Edit"
    insert_edited_customer_data "New Mobile", "New Name", "New Address"
		click_on "Update Customer"

    expect_to_display_customer "New Mobile", "New Name", "New Address"
	end
  
end