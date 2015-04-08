FactoryGirl.define do
  factory :field do
  	association :sub_category
  	association :field_element
    title "Name"
    order 1
  end
end