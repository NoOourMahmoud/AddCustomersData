class AddColumnToCustomerDataSheet < ActiveRecord::Migration[6.1]
  def change
    add_column :customer_data_sheets, :sheet, :attachment
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
