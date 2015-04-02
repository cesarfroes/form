require 'rails_helper'

RSpec.describe Category, type: :view do
  before(:each) do
    assign(:categories, create(:category))
  end

  it "renders a list of categories" do
    visit "categories/"

    expect(page).to have_content("Reformas e Reparos")
  end
end