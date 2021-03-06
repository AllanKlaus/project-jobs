class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :get_job, only: [:show, :edit, :update]
  before_action :job_owner, only: [:edit, :update]
  before_action :get_references, only: [:new, :create, :edit, :update]

  skip_before_filter :verify_authenticity_token, only: [:search]

  respond_to :html

  def index
    @jobs = JobPresenter.new(Job.order(updated_at: :desc).all)
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(jobs_params)
    respond_with @job
  end

  def edit
  end

  def update
    @job.update(jobs_params)
    respond_with @job
  end

  def search
    @jobs = Job.where("title LIKE ?", "%#{params[:title]}%")
    render :index
  end

  def contracts
    @jobs = Job.where(contract: params[:contract])
    render :index
  end

  private

  def jobs_params
    params.require(:job).permit(:title, :location, :description, :category_id, :company_id)
  end

  def jobs_params_search
    params.require(:job).permit(:title)
  end

  def get_job
    @job = JobPresenter.new(Job.find(params[:id]))
  end

  def job_owner
    if @job.company.user != current_user
      flash[:warning] = 'Warning: You can only edit your jobs'
      redirect_to root_path
    end
  end

  def get_references
    @categories = Category.all
    @companies = current_user.companies
    @contracts = Job::CONTRACT_TYPE
  end

end
