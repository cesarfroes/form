class FieldElement < ActiveRecord::Base
    has_many :fields, inverse_of: :field_element

	#belongs_to :field, inverse_of: :field_elements
	validates :element, inclusion: %w(
		                              check_box 
		                              date_field 
		                              datetime_field
		                              password_field
		                              phone_field
		                              text_area
		                              text_field
		                              select
		                              collection_select
		                              )
end
