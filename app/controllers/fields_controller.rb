class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]
  
  def index
    @fields = Field.all()
  end

  def new
    @field = Field.new
    load_select
  end

  def create
    @field = Field.new(fields_params)
    load_select
    
    if @field.save
      redirect_to fields_path, notice: 'Field was successfully created.'
    else
      render :new
    end
  end

  def edit
    load_select
    
    if @field.field_element.options == false
      @options_none = "none"
    end
  end  

  def update
    if @field.update(fields_params)
      redirect_to fields_path, notice: 'Field was successfully updated.'
    else
      load_select
      render :edit
    end
  end 

  def destroy
    @field.destroy
    redirect_to fields_path, notice: 'Field was successfully destroyed.'
  end

  def options
    field_element = FieldElement.find(params[:field_element])

    render json: msg = { :options => field_element.options }
  end

  private
    def load_select
      list_categories
      list_sub_categories
      list_field_elements 
    end
    def list_categories
      @categories = Category.all().order("name ASC")
    end

    def list_sub_categories
      @sub_categories = SubCategory.all().order("name ASC")
    end
    
    def list_field_elements
      @field_elements = FieldElement.all().order("element ASC")
    end      
    
    def set_field
      @field = Field.find(params[:id])
      @category_id = @field.sub_category.category_id
    end

    def fields_params
      params.require(:field).permit(:title, :order, :sub_category_id, :field_element_id, :options)
    end
end
