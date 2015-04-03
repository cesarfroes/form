class FieldElementsController < ApplicationController
  before_action :set_field_elements, only: [:show, :edit, :update, :destroy]
  
  def index
    @field_elements = FieldElement.all()
  end

  def new
    @field_element = FieldElement.new
  end

  def create
    @field_element = FieldElement.new(field_elements_params)

    if @field_element.save
      redirect_to field_elements_path, notice: 'Field element was successfully created.'
    else
      render :new
    end
  end

  def edit
  	
  end  

  def update
    if @field_element.update(field_elements_params)
      redirect_to field_elements_path, notice: 'Field element was successfully updated.'
    else
      render :edit
    end
  end 

  def destroy
    @field_element.destroy
    redirect_to field_elements_path, notice: 'Field element was successfully destroyed.'
  end 

  private
    def set_field_elements
      @field_element = FieldElement.find(params[:id])
    end

    def field_elements_params
      params.require(:field_element).permit(:element, :options)
    end
end
