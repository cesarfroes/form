class CreateFieldElements < ActiveRecord::Migration
  def change
    create_table :field_elements do |t|
      t.string :element
      t.boolean :options

      t.timestamps null: false
    end
  end
end
