FactoryGirl.define do
  factory :sub_category do
  	association :category
    name "pintor"
    slug "pintor"
  end
end