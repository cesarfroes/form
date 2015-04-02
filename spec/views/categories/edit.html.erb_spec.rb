require 'rails_helper'

RSpec.describe Category, type: :view do
  before(:each) do
    @category = assign(:categories, create(:category))
  end

  it "changing a category" do
    visit "/categories/#{@category.id}/edit"

    fill_in "Name", with: "aulas"
    fill_in "Slug", with: "aulas"

    click_button "Update Category"

    expect(current_path).to eql(categories_path)
    expect(page).to have_content("Category was successfully updated.")
  end

  it "changing a category to a invalid category" do
    visit "/categories/#{@category.id}/edit"

    fill_in "Name", with: "aulas$#"
    fill_in "Slug", with: "aulas"

    click_button "Update Category"
    
    expect(page).to have_content("Name is invalid")    
  end
end