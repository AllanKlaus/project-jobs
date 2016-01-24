require 'rails_helper'

feature 'User see button to edit jobs' do
  scenario 'logged user on home' do
    login_user

    5.times do |job|
      create_job(nil, nil, job)
    end

    visit root_path

    expect(page).to have_content "Edit"
  end

  scenario 'unlogged user on home' do
    5.times do |job|
      create_job(nil, nil, job)
    end

    visit root_path

    expect(page).to_not have_content "Edit"
  end

  scenario 'logged user on jobs' do
    login_user

    5.times do |job|
      create_job(nil, nil, job)
    end

    visit jobs_path

    expect(page).to have_content "Edit"
  end

  scenario 'unlogged user on jobs' do
    5.times do |job|
      create_job(nil, nil, job)
    end

    visit jobs_path

    expect(page).to_not have_content "Edit"
  end

  scenario 'logged user on job' do
    login_user

    job = create_job(nil, nil, 5)

    visit job_path(job)

    expect(page).to have_content "Edit"
  end

  scenario 'unlogged user on job' do
    job = create_job(nil, nil, 5)

    visit job_path(job)

    expect(page).to_not have_content "Edit"
  end
end
