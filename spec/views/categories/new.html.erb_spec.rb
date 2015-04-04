require 'rails_helper'

RSpec.describe Category, type: :view do
  before(:each) do
    assign(:categories, create(:category))
  end

  it "category's new page exists" do
  	visit "/categories"

  	click_link "new"

  	expect(current_path).to eql(new_category_path)
    expect(page).to have_content("New Category")
  end

  it "creating a new category" do
    visit "/categories/new"

    fill_in "Name", with: "aulas"
    fill_in "Slug", with: "aulas"

    click_button "Create Category"

    expect(current_path).to eql(categories_path)
    expect(page).to have_content("Category was successfully created.")
  end
  it "creating a invalid category" do 
    visit "/categories/new"

    fill_in "Name", with: "aulas$#"
    fill_in "Slug", with: "aulas-!#"

    click_button "Create Category"
    
    expect(page).to have_content("Name is invalid")  
  end
end