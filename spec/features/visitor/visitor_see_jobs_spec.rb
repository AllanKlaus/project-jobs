require 'rails_helper'

feature 'Visitor see jobs' do
  scenario 'see jobs on home' do
    5.times do |number|
      create_job(nil, nil, number)
    end

    visit root_path

    5.times do |number|
      expect(page).to have_content "Macro Job #{number}"
    end
  end

  scenario 'see job page' do
    5.times do |number|
      create_job(nil, nil, number)
    end

    visit jobs_path

    5.times do |number|
      expect(page).to have_content "Macro Job #{number}"
    end
  end

  scenario 'see job page' do
    job = create_job(nil, nil, 10)

    visit job_path(job)

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content job.company.name
  end

  scenario 'see job on company page' do
    company = create_company(5)
    job = create_job(company, nil, 10)

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content company.location

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.location
  end

  scenario 'see job on category page' do
    category = create_category(5)
    job = create_job(nil, category, 10)

    visit category_path(category)

    expect(page).to have_content category.name

    expect(page).to have_content job.title
    expect(page).to have_content job.company.name
    expect(page).to have_content job.location
  end

end
