#module Features
  def insert_new_customer(mobile, name, address)
    Customer.destroy_all
    Customer.create!(mobile: mobile, name: name, address: address)
  end

  def expect_to_display_customer(mobile, name, address)
    expect(page).to have_css "h5", text: name
    expect(page).to have_css "p", text: mobile
    expect(page).to have_css "p", text: address
  end

  def insert_edited_customer_data(mobile, name, address)
    fill_in "Mobile", with: mobile
    fill_in "Name", with: name
    fill_in "Address", with: address
  end
#end