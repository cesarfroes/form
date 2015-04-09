require 'rails_helper'

RSpec.describe Field, type: :view do
  before(:each) do
    assign(:fields, create(:field))
  end

  it "field's new page exists" do
  	visit "/fields"

  	click_link "new"

  	expect(current_path).to eql(new_field_path)
    expect(page).to have_content("New Field")
  end

  it "creating a new field" do
    visit "/fields/new"

    fill_in "Title", with: "Name2"
    page.select 'pintor', :from=> "Sub category" 
    page.select 'text', :from=> "Field element" 
    fill_in "Order", with: 2

    click_button "Create Field"

    expect(current_path).to eql(fields_path)
    expect(page).to have_content("Field was successfully created.")
  end

  it "creating a invalid field" do 
    visit "/fields/new"

    fill_in "Title", with: "Name2#!"
    page.select 'pintor', :from=> "Sub category" 
    page.select 'text', :from=> "Field element" 
    fill_in "Order", with: 2

    click_button "Create Field"
    
    expect(page).to have_content("Title is invalid")  
  end
end