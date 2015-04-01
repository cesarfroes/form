require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid category" do
    expect(build(:category)).to be_valid
  end

  it "has a invalid category"
  it "has a valid slug"
  it "has a invalid slug"

end