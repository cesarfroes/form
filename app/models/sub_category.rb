class SubCategory < ActiveRecord::Base
  has_many :fields, inverse_of: :field_element
  belongs_to :category, inverse_of: :sub_categories

  validates_format_of :name, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true
  validates_format_of :slug, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true
end
