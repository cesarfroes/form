require 'rails_helper'

RSpec.describe FieldElement, type: :view do
  before(:each) do
    assign(:field_elements, create(:field_element))
  end

  it "renders a list of field elements" do
    visit "field_elements/"

    expect(page).to have_content("text_field")
  end
end