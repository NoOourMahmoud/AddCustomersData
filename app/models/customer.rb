class Customer < ApplicationRecord
  validates :mobile, :name, :address, presence: true
  validates :mobile, uniqueness: true
end
