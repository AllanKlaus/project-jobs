module ApplicationHelper
  def get_job_search
    @search = Job.new
  end

  def controller_empty(page)
    "There is no #{page}"
  end
end
