class AddIndexToCustomerMobile < ActiveRecord::Migration[6.1]
  def change
    change_column :customers, :mobile, :string, index: true, unique: true
  end
end
