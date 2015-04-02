class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all()
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
  	
  end  

  def update
    if @category.update(categories_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end 

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end 

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def categories_params
      params.require(:category).permit(:name, :slug)
    end
end
