class CustomerDataSheet < ApplicationRecord
  has_one_attached :sheet

  def sheet_path
    ActiveStorage::Blob.service.path_for(sheet.key)
  end

end
