require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  it "has a valid subcategory" do
    expect(build(:sub_category)).to be_valid
  end

  it "has a invalid subcategory" do
    expect(build(:sub_category, name: "?pintor#")).to be_invalid
  end

  it "has a valid slug" do
    expect(build(:sub_category)).to be_valid
  end
  
  it "has a invalid slug" do
    expect(build(:sub_category, slug: "reparo|pintor")).to be_invalid
  end
end