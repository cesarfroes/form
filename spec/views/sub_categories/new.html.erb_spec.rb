require 'rails_helper'

RSpec.describe Category, type: :view do
  before(:each) do
    assign(:sub_categories, create(:sub_category))
  end

  it "sub_category's new page existe" do
  	visit "/sub_categories"

  	click_link "new"

  	expect(current_path).to eql(new_sub_category_path)
    expect(page).to have_content("New SubCategory")
  end

  it "creating a new subcategory" do
    visit "/sub_categories/new"

    fill_in "Name", with: "aulas"
    fill_in "Slug", with: "aulas"

    click_button "Create Sub category"

    expect(current_path).to eql(sub_categories_path)
    expect(page).to have_content("SubCategory was successfully created.")
  end
  it "creating a invalid subcategory" do 
    visit "/sub_categories/new"

    fill_in "Name", with: "aulas$#"
    fill_in "Slug", with: "aulas-!#"

    click_button "Create Sub category"
    
    expect(page).to have_content("Name is invalid")  
  end
end