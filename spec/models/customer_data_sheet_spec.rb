require "rails_helper"

describe CustomerDataSheet , type: :model do

  it { should have_one_attached(:sheet) }

  describe "Validations" do
    it { should validate_presence_of(:sheet) }
  end
  
end
