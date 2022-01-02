require "rails_helper"

feature "Delete Customer" do
	scenario "successfully" do
    
		insert_new_customer "Temp Mobile Number", "Temp Customer Name", "Temp Customer Address"
    visit customers_path
    
    click_on "Delete"

    expect_not_to_display_customer "Temp Mobile Number", "Temp Customer Name", "Temp Customer Address"
	end
  
end