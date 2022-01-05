require "rails_helper"

describe Customer, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:mobile) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_uniqueness_of(:mobile)}
  end
end
