class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.references :sub_category, index: true
      t.references :field_element, index: true
      t.string :title
      t.integer :order

      t.timestamps null: false
    end
    add_foreign_key :fields, :sub_categories
    add_foreign_key :fields, :field_elements
  end
end
