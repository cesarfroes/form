class SubCategory < ActiveRecord::Base
  belongs_to :category, inverse_of: :sub_categories
  validates_format_of :name, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true
  validates_format_of :slug, :with => /^[^#\[\]{}$%&|!]+$/, :multiline => true

  validates :category_id, presence: true
end
