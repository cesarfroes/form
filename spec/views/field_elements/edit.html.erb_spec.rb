require 'rails_helper'

RSpec.describe FieldElement, type: :view do
  before(:each) do
    @field_element = assign(:field_elements, create(:field_element))
  end

  it "changing field element" do
    visit "/field_elements/#{@field_element.id}/edit"

    fill_in "Element", with: "text_field"
    page.select 'True', :from=> "Options"    

    click_button "Update Field element"

    expect(current_path).to eql(field_elements_path)
    expect(page).to have_content("Field element was successfully updated.")
  end

  it "changing field element to a invalid type" do
    visit "/field_elements/#{@field_element.id}/edit"

    fill_in "Element", with: "input"
    page.select 'True', :from=> "Options"

    click_button "Update Field element"
    
    expect(page).to have_content("Element is not included in the list")    
  end
end