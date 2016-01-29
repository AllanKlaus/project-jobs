require 'rails_helper'

feature 'User do CRUD on jobs' do
  scenario 'user read jobs' do

    array_jobs = []
    5.times do |job|
      job = create_job(title: "Reading Job #{job}")
      array_jobs << job.title
    end

    visit jobs_path

    array_jobs.each do |job_title|
      expect(page).to have_content job_title
    end
  end

  scenario 'user create jobs' do
    user = login_user

    company = create_company(user: user)
    job = create_job(company: company)

    visit new_job_path

    expect(page).to have_content 'Create Job'

    fill_in 'job[title]',       with: job.title
    fill_in 'job[location]',    with: job.location
    fill_in 'job[description]', with: job.description
    select company.name,        from: 'job[company_id]'
    select job.category.name,   from: 'job[category_id]'
    select job.contract,        from: 'job[contract]'

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.description
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
  end

  scenario 'user update job' do
    user = login_user

    company = create_company(user: user)
    job = create_job(company: company)

    visit edit_job_path(job)

    expect(page).to have_content 'Edit Job'

    fill_in 'job[title]',       with: job.title
    fill_in 'job[location]',    with: job.location
    fill_in 'job[description]', with: job.description
    select company.name,        from: 'job[company_id]'
    select job.category.name,   from: 'job[category_id]'
    select job.contract,        from: 'job[contract]'

    click_on 'submit'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.description
    expect(page).to have_content job.company.name
    expect(page).to have_content job.category.name
    expect(page).to have_content job.contract
  end

  scenario 'user try to create an invalid job' do
    login_user

    visit new_job_path

    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

end
