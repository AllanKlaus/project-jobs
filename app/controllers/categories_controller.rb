class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :get_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(companies_params)
    if @category.save()
      flash[:success] = 'Success: Category created successfully'
      redirect_to @category
    else
      flash[:warning] = 'Warning: All fields are necessary'
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(companies_params)
      flash[:success] = 'Success: Category updated successfully'
      redirect_to @category
    else
      flash[:warning] = 'Warning: All fields are necessary'
      render :edit
    end
  end

  private
  def companies_params
    params.require(:category).permit(:name)
  end

  def get_category
    @category = Category.find(params[:id])
  end

end
