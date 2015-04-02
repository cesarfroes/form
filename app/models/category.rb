class Category < ActiveRecord::Base
  has_many :sub_categories, inverse_of: :category
  validates_format_of :name, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true
  validates_format_of :slug, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true
end
