require "rails_helper"

feature "View Customers" do
	scenario "successfully" do
    
		insert_new_customer "Temp Mobile Number", "Temp Customer Name", "Temp Customer Address"
    visit customers_path
    
    expect_to_display_customer "Temp Mobile Number", "Temp Customer Name", "Temp Customer Address"
	end
  
end