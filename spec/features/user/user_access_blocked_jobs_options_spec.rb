require 'rails_helper'

feature 'User access blocked jobs options' do
  scenario 'user unlogged access new job' do
    create_job
    visit new_job_path

    expect(page).to have_content "Log in"
  end

  scenario 'user unlogged access update job' do
    visit edit_job_path(create_job)

    expect(page).to have_content "Log in"
  end
end
