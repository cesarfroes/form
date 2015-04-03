require 'rails_helper'

RSpec.describe SubCategory, type: :view do
  before(:each) do
    @sub_category = assign(:sub_categories, create(:sub_category))
  end

  it "changing a category" do
    visit "/sub_categories/#{@sub_category.id}/edit"

    fill_in "Name", with: "pedreiro"
    fill_in "Slug", with: "pedreiro"

    click_button "Update Sub category"

    expect(current_path).to eql(sub_categories_path)
    expect(page).to have_content("SubCategory was successfully updated.")
  end

  it "changing a category to a invalid sub category" do
    visit "/sub_categories/#{@sub_category.id}/edit"

    fill_in "Name", with: "pedreiro$#"
    fill_in "Slug", with: "pedreiro"

    click_button "Update Sub category"
    
    expect(page).to have_content("Name is invalid")    
  end
end