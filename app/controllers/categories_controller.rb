class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
