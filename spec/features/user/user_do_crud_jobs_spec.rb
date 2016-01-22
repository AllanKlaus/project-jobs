require 'rails_helper'

feature 'User do CRUD on jobs' do
  scenario 'user read jobs' do

    5.times do |job|
      create_job(nil, nil, job)
    end

    visit jobs_path

    expect(page).to have_content "Macro Job 0"
    expect(page).to have_content "Macro Job 1"
    expect(page).to have_content "Macro Job 2"
    expect(page).to have_content "Macro Job 3"
    expect(page).to have_content "Macro Job 4"
  end

  scenario 'user create jobs' do
    login_user

    category = create_category(1)
    company = create_company(10)
    job = create_job

    visit new_job_path

    fill_in 'job[title]', with: job.title
    fill_in 'job[location]', with: job.location
    fill_in 'job[description]', with: job.description
    select company.name, from: 'job[company_id]'
    select category.name, from: 'job[category_id]'

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.description
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
  end

  scenario 'user update job' do
    login_user

    category = create_category(5)
    company = create_company(10)
    job = create_job(company, category)

    visit edit_job_path(job)

    fill_in 'job[title]', with: job.title
    fill_in 'job[location]', with: job.location
    fill_in 'job[description]', with: job.description
    select company.name, from: 'job[company_id]'
    select category.name, from: 'job[category_id]'

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.description
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
  end

  scenario 'user try to create an invalid job' do
    login_user

    visit new_job_path

    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

end
