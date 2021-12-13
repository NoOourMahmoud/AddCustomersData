class CreateCustomerDataSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_data_sheets do |t|

      t.timestamps
    end
  end
end
