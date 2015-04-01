require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid category" do
    expect(build(:category)).to be_valid
  end

  it "has a invalid category" do
    expect(build(:category, name: "?Reparos#")).to be_invalid
  end

  it "has a valid slug" do
    expect(build(:category)).to be_valid
  end
  
  it "has a invalid slug" do
    expect(build(:category, slug: "reparos|pintor")).to be_invalid
  end
end