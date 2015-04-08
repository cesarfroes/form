require 'rails_helper'

RSpec.describe Field, type: :model do
  it "has a valid field" do
    expect(build(:field)).to be_valid
  end

  it "has a invalid field" do
    expect(build(:field, title: "input$#!")).to be_invalid
  end
end
