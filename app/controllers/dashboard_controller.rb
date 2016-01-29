class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :get_references, only: [:index]

  def index
  end

  private

  def get_references
    @companies = current_user.companies
    @jobs = current_user.jobs
    @categories = current_user.categories
  end

end
