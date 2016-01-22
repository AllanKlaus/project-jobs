require 'rails_helper'

feature 'User access blocked contents' do
  scenario 'user unlogged access new jobs' do
    create_job
    visit new_job_path

    expect(page).to have_content "Log in"
  end

  scenario 'user unlogged access update job' do
    job = create_job

    visit edit_job_path(job)

    expect(page).to have_content "Log in"
  end
end
