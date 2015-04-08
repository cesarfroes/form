class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]
  
  def index
    @fields = Field.all()
  end

  def new
    @field = Field.new
    list_sub_categories
    list_field_elements
  end

  def create
    @field = Field.new(fields_params)
    list_sub_categories
    list_field_elements
    
    if @field.save
      redirect_to fields_path, notice: 'Field was successfully created.'
    else
      render :new
    end
  end

  def edit
    list_sub_categories
    list_field_elements  	
  end  

  def update
    if @field.update(fields_params)
      redirect_to fields_path, notice: 'Field was successfully updated.'
    else
      list_sub_categories
      list_field_elements 
      render :edit
    end
  end 

  def destroy
    @field.destroy
    redirect_to fields_path, notice: 'Field was successfully destroyed.'
  end 

  private
    def list_sub_categories
      @sub_categories = SubCategory.all().order("name ASC")
    end
    
    def list_field_elements
      @field_elements = FieldElement.all().order("element ASC")
    end      
    
    def set_field
      @field = Field.find(params[:id])
    end

    def fields_params
      params.require(:field).permit(:title, :order, :sub_category_id, :field_element_id)
    end
end
