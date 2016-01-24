class HomeController < ApplicationController
  def index
    # @jobs = Job.where("updated_at < ADDDATE(NOW(), 90)").order(updated_at: :desc).all
    @jobs = Job.order(updated_at: :desc).all
    @companies = Company.all
    @categories = Category.all
  end
end
