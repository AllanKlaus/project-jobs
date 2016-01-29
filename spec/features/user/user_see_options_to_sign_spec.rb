require 'rails_helper'

feature 'User see options to sign ' do
  scenario 'user see message to sign in and sing up when is unlogged' do
    visit root_path

    expect(page).to have_content "Sign in"
    expect(page).to have_content "Sign up"
    expect(page).to_not have_content "Sign out"
  end

  scenario 'user see message to sign out when is logged' do
    login_user

    visit root_path

    expect(page).to_not have_content "Sign in"
    expect(page).to_not have_content "Sign up"
    expect(page).to have_content "Sign out"
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
