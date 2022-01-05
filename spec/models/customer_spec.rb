require "rails_helper"

describe Customer, type: :model do
  subject { 
    described_class.new(
      mobile: "20 1176987456",
      name: "Nourhan Mahmoud",
      address: "7 oraby st cairo"
    )
   } 
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "isn't valid without Mobile" do
    subject.mobile = nil
    expect(subject).not_to be_valid
  end
  it "isn't valid without Name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  it "isn't valid without Address" do
    subject.address = nil
    expect(subject).not_to be_valid
  end  
end
