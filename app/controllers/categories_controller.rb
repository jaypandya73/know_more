class CategoriesController < ApplicationController


  def index
    @categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfuly."
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Updated successfuly."
      redirect_to @category
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    flash[:danger] = "Deleted successfuly."
    redirect_to @category
  end

  private

  def category_params
  	params.require(:category).permit(:name)
  end
end
