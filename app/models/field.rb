class Field < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :field_element
  #has_many :field_elements, inverse_of: :field

  validates_format_of :title, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true
  
end
