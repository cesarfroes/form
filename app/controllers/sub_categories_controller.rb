class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @sub_categories = SubCategory.all()
  end

  def new
    @sub_category = SubCategory.new
    list_categories
  end

  def create
    @sub_category = SubCategory.new(sub_categories_params)
    list_categories

    if @sub_category.save
      redirect_to sub_categories_path, notice: 'SubCategory was successfully created.'
    else
      render :new
    end
  end

  def edit
  	list_categories
  end  

  def update
    if @sub_category.update(sub_categories_params)
      redirect_to sub_categories_path, notice: 'SubCategory was successfully updated.'
    else
      list_categories
      render :edit
    end
  end 

  def destroy
    @sub_category.destroy
    redirect_to sub_categories_path, notice: 'SubCategory was successfully destroyed.'
  end 

  private
    def list_categories
      @categories = Category.all().order("name ASC")
    end
    def set_sub_category
      @sub_category = SubCategory.find(params[:id])
    end

    def sub_categories_params
      params.require(:sub_category).permit(:name, :slug, :category_id)
    end
end
