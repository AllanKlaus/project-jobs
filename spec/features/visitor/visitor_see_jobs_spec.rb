require 'rails_helper'

feature 'Visitor see jobs' do
  scenario 'see jobs on home' do
    5.times do |number|
      create_job(title: "Macro Job #{number}")
    end

    visit root_path

    5.times do |number|
      expect(page).to have_content "Macro Job #{number}"
    end
  end

  scenario 'see job page' do
    5.times do |number|
      create_job(title: "Macro Job #{number}")
    end

    visit jobs_path

    5.times do |number|
      expect(page).to have_content "Macro Job #{number}"
    end
  end

  scenario 'see job page' do
    job = create_job

    visit job_path(job)

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content job.company.name
    expect(page).to have_content job.contract
  end

  scenario 'see job on company page' do
    company = create_company
    job = create_job(company: company)

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content company.location

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.location
    expect(page).to have_content job.contract
  end

  scenario 'see job on category page' do
    category = create_category
    job = create_job(category: category)

    visit category_path(category)

    expect(page).to have_content category.name

    expect(page).to have_content job.title
    expect(page).to have_content job.company.name
    expect(page).to have_content job.location
    expect(page).to have_content job.contract
  end

end
