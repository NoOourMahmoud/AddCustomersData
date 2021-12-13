class DropSheetTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :customer_data_sheets
  end
end
