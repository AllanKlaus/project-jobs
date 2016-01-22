class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :get_job, only: [:show, :edit, :update]
  before_action :get_references, only: [:new, :create, :edit, :update]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
    if @job.save()
      flash[:success] = 'Success: Job created successfully'
      redirect_to @job
    else
      flash[:warning] = 'Warning: All fields are necessary'
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(jobs_params)
      flash[:success] = 'Success: Job updated successfully'
      redirect_to @job
    else
      flash[:warning] = 'Warning: All fields are necessary'
      render :edit
    end
  end

  private
  def jobs_params
    params.require(:job).permit(:title, :location, :description, :category_id, :company_id)
  end

  def get_job
    @job = Job.find(params[:id])
  end

  def get_references
    @categories = Category.all
    @companies = Company.all
  end

end
