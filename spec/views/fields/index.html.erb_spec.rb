require 'rails_helper'

RSpec.describe Category, type: :view do
  before(:each) do
    assign(:fields, create(:field))
  end

  it "renders a list of fields" do
    visit "fields/"

    expect(page).to have_content("Reformas e Reparos")
  end
end