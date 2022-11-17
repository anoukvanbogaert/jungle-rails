class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
                               password: ENV["HTTP_BASIC_PASSWORD"],
                               if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :products], notice: 'Category created!'
    else
      render :new_category
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end