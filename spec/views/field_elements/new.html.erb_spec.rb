require 'rails_helper'

RSpec.describe FieldElement, type: :view do
  before(:each) do
    assign(:field_elements, create(:field_element))
  end

  it "field element's new page exists" do
  	visit "/field_elements"

  	click_link "new"

  	expect(current_path).to eql(new_field_element_path)
    expect(page).to have_content("New Field Element")
  end

  it "creating a new field element" do
    visit "/field_elements/new"

    fill_in "Element", with: "text_area"
    page.select 'True', :from=> "Options"

    click_button "Create Field element"

    expect(current_path).to eql(field_elements_path)
    expect(page).to have_content("Field element was successfully created.")
  end
  it "creating a invalid field element" do 
    visit "/field_elements/new"

    fill_in "Element", with: "text"
    page.select 'True', :from=> "Options"

    click_button "Create Field element"
    
    expect(page).to have_content("Element is not included in the list")  
  end
end