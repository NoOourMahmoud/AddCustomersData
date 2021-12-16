class CustomerDataSheet < ApplicationRecord
  has_one_attached :sheet
  validates :sheet, presence: true
end
