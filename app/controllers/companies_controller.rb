class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :get_company, only: [:show, :edit, :update]

  respond_to :html

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(companies_params)
    respond_with @company
  end

  def edit
  end

  def update
    @company.update(companies_params)
    respond_with @company
  end

  private
  def companies_params
    params.require(:company).permit(:name, :location, :mail, :phone, :photo)
  end

  def get_company
    @company = Company.find(params[:id])
  end

end
