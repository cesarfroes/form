require 'rails_helper'

RSpec.describe Field, type: :view do
  before(:each) do
    @field = assign(:fields, create(:field))
  end

  it "changing a category" do
    visit "/fields/#{@field.id}/edit"

    fill_in "Title", with: "Name2"
    page.select 'pintor', :from=> "Sub category" 
    page.select 'text_field', :from=> "Field element" 
    fill_in "Order", with: 2

    click_button "Update Field"

    expect(current_path).to eql(fields_path)
    expect(page).to have_content("Field was successfully updated.")
  end

  it "changing a category to a invalid field" do
    visit "/fields/#{@field.id}/edit"

    fill_in "Title", with: "Name2#!#"
    page.select 'pintor', :from=> "Sub category" 
    page.select 'text_field', :from=> "Field element" 
    fill_in "Order", with: 2

    click_button "Update Field"
    
    expect(page).to have_content("Title is invalid")   
  end
end