class JobPresenter < SimpleDelegator
  attr_reader :job

  def initialize(job)
    @job = job
    __setobj__(job)
  end

  def eql?(target)
    target == self || job.eql?(target)
  end

  def is_expired
    if job.expired?
      helpers.content_tag(:p, helpers.content_tag(:strong, "Job Expired"), class: "text-left")
    end
  end

  def is_logged
    if job.is_logged?
      helpers.link_to "Edit", edit_job_path(job), class: 'btn btn-primary'
    end
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
