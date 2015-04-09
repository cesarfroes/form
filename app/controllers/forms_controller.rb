class FormsController < ApplicationController
  def index

    category = Category.joins(:sub_categories)
					    .where("sub_categories.slug = ? and categories.slug = ?", 
					      params[:slug_sub_category], params[:slug_category])
					    .select("sub_categories.id").first

    field_elements = Field.joins(:field_element).where("fields.sub_category_id = ?", category.id)
    
    @fields = []
    
    field_elements.each do |fe|
      values = false
      if fe.field_element.options?
        values = fe.options.split(",")
      end

      @fields.push(title: fe.title,
      	           order: fe.order,
                   type: fe.field_element.element,
                   values: values
      	          )
    end

  end
end