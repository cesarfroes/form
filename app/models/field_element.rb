class FieldElement < ActiveRecord::Base
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
