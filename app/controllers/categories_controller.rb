class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :get_category, only: [:show, :edit, :update]

  respond_to :html

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(companies_params)
    respond_with @category
  end

  def edit
  end

  def update
    @category.update(companies_params)
    respond_with @category
  end

  private
  def companies_params
    params.require(:category).permit(:name)
  end

  def get_category
    @category = Category.find(params[:id])
  end

end
