require "rails_helper"

feature "View Customers" do
	scenario "successfully" do
		#insert_new_customer
    Customer.destroy_all
    Customer.create!(mobile: "123", name: "Temp Customer", address: "Temp Address")
    
    visit customers_path
    

		expect(page).to have_css "h5", text: "Temp Customer"
    expect(page).to have_css "p", text: "123"
    expect(page).to have_css "p", text: "Temp Address"

	end
  
end