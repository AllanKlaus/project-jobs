require 'rails_helper'

feature 'User do CRUD on jobs' do
  scenario 'user update his job' do
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

  scenario 'user try to update a job that dont belongs to him' do
    user = login_user

    company = create_company(user: user)

    company = create_company
    job = create_job(company: company)

    visit edit_job_path(job)

    expect(page).to have_content 'Warning: You can only edit your jobs'
  end

end
