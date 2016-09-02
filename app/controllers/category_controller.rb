class CategoryController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_url, notice: '分類新增成功'
    else
      redirect_to :back
    end
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end
end
