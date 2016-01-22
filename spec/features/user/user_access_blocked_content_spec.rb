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

  scenario 'user logged access new jobs' do
    user = create_user

    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: set_password

    click_on 'Log in'

    visit new_job_path

    expect(page).to have_content "Title"
  end

  # scenario 'user logged access update job' do
  #   job = create_job
  #
  #   visit edit_job_path(job)
  #
  #   expect(page).to have_content "Login Page"
  # end
end
