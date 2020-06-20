class CategoriesController < ApplicationController
  def index
  	@parents = Category.where(ancestry: nil)
  end

  def edit
  end

  def update
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
