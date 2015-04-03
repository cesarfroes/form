require 'rails_helper'

RSpec.describe FieldElement, type: :model do
  it "has a valid field element" do
    expect(build(:field_element)).to be_valid
  end

  it "has a invalid field element" do
    expect(build(:field_element, element: "input")).to be_invalid
  end
end
