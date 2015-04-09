class Field < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :field_element
  
  validates_format_of :title, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true
  validates :sub_category_id, :presence => true
  validates :field_element_id, :presence => true
end
