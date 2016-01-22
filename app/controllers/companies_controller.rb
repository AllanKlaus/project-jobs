class CompaniesController < ApplicationController
  before_action :get_company, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companies_params)
    if @company.save()
      flash[:success] = 'Success: Company created successfully'
      redirect_to @company
    else
      flash[:warning] = 'Warning: All fields are necessary'
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(companies_params)
      flash[:success] = 'Success: Company updated successfully'
      redirect_to @company
    else
      flash[:warning] = 'Warning: All fields are necessary'
      render :edit
    end
  end

  private
  def companies_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

  def get_company
    @company = Company.find(params[:id])
  end

end
