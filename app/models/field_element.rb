class FieldElement < ActiveRecord::Base
    has_many :fields, inverse_of: :field_element

	validates :element, inclusion: %w(
		                              check_box
		                              password
		                              text_area
		                              text
		                              select
		                              )
end
