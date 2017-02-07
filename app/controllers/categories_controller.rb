class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    render json: @categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'

    end 
  end

  def show
    @posts = @category.posts
    render json: @category
  end
    
  def edit
  end

  def update
    if @category.update(category_params) 
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy  
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
