class HomeController < ApplicationController
  def index
    @jobs = Job.order(updated_at: :desc).all
    @companies = Company.all
    @categories = Category.all
  end
end
