require 'rails_helper'

feature 'Visitor not see expired jobs' do
  scenario 'on home' do
    days = [0,89,90,91,100]

    create_job(title: 'Job created at 0 days')
    travel_to 89.days.ago do
      create_job(title: 'Job created at 89 days')
    end
    travel_to 90.days.ago do
      create_job(title: 'Job created at 90 days')
    end
    travel_to 91.days.ago do
      create_job(title: 'Job created at 91 days')
    end
    travel_to 100.days.ago do
      create_job(title: 'Job created at 100 days')
    end

    visit root_path

    days.each do |day|
      if day < 90
        expect(page).to have_content "Job created at #{day} days"
      else
        expect(page).to_not have_content "Job created at #{day} days"
      end
    end
  end

  scenario 'on jobs page' do
    days = [0,89,90,91,100]

    create_job(title: 'Job created at 0 days')
    travel_to 89.days.ago do
      create_job(title: 'Job created at 89 days')
    end
    travel_to 90.days.ago do
      create_job(title: 'Job created at 90 days')
    end
    travel_to 91.days.ago do
      create_job(title: 'Job created at 91 days')
    end
    travel_to 100.days.ago do
      create_job(title: 'Job created at 100 days')
    end

    visit jobs_path

    days.each do |day|
      if day < 90
        expect(page).to have_content "Job created at #{day} days"
      else
        expect(page).to_not have_content "Job created at #{day} days"
      end
    end
  end

  scenario 'on job not expired page' do
    job = create_job

    visit job_path(job)

    expect(page).to_not have_content "Job Expired"
  end

  scenario 'on job expired page' do
    job = nil
    travel_to 100.days.ago do
      job = create_job
    end

    visit job_path(job)

    expect(page).to have_content "Job Expired"
  end

  scenario 'on company page' do
    company = create_company

    days = [0,89,90,91,100]

    create_job(title: 'Job created at 0 days', company: company)
    travel_to 89.days.ago do
      create_job(title: 'Job created at 89 days', company: company)
    end
    travel_to 90.days.ago do
      create_job(title: 'Job created at 90 days', company: company)
    end
    travel_to 91.days.ago do
      create_job(title: 'Job created at 91 days', company: company)
    end
    travel_to 100.days.ago do
      create_job(title: 'Job created at 100 days', company: company)
    end

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content company.location

    days.each do |day|
      if day < 90
        expect(page).to have_content "Job created at #{day} days"
      else
        expect(page).to_not have_content "Job created at #{day} days"
      end
    end

  end

  scenario 'on category page' do
    category = create_category

    days = [0,89,90,91,100]

    create_job(title: 'Job created at 0 days' , category: category)
    travel_to 89.days.ago do
      create_job(title: 'Job created at 89 days' , category: category)
    end
    travel_to 90.days.ago do
      create_job(title: 'Job created at 90 days' , category: category)
    end
    travel_to 91.days.ago do
      create_job(title: 'Job created at 91 days' , category: category)
    end
    travel_to 100.days.ago do
      create_job(title: 'Job created at 100 days' , category: category)
    end


    visit category_path(category)

    expect(page).to have_content category.name

    days.each do |day|
      if day < 90
        expect(page).to have_content "Job created at #{day} days"
      else
        expect(page).to_not have_content "Job created at #{day} days"
      end
    end
  end

end
