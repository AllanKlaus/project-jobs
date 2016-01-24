require 'rails_helper'

feature 'Visitor not see expired jobs' do
  scenario 'on home' do
    days = [0,89,90,91,100]

    create_job(nil, nil, 0)
    travel_to 89.days.ago do
      create_job(nil, nil, 89)
    end
    travel_to 90.days.ago do
      create_job(nil, nil, 90)
    end
    travel_to 91.days.ago do
      create_job(nil, nil, 91)
    end
    travel_to 100.days.ago do
      create_job(nil, nil, 100)
    end

    visit root_path

    days.each do |day|
      if day < 90
        expect(page).to have_content "Macro Job #{day}"
      else
        expect(page).to_not have_content "Macro Job #{day}"
      end
    end
  end

  scenario 'on jobs page' do
    days = [0,89,90,91,100]

    create_job(nil, nil, 0)
    travel_to 89.days.ago do
      create_job(nil, nil, 89)
    end
    travel_to 90.days.ago do
      create_job(nil, nil, 90)
    end
    travel_to 91.days.ago do
      create_job(nil, nil, 91)
    end
    travel_to 100.days.ago do
      create_job(nil, nil, 100)
    end

    visit jobs_path

    days.each do |day|
      if day < 90
        expect(page).to have_content "Macro Job #{day}"
      else
        expect(page).to_not have_content "Macro Job #{day}"
      end
    end
  end

  scenario 'on job not expired page' do
    job = nil
    travel_to 100.days.ago do
      job = create_job(nil, nil, 100)
    end

    visit job_path(job)

    expect(page).to have_content "Job Expired"
  end

  scenario 'on company page' do
    company = create_company(5)

    days = [0,89,90,91,100]

    create_job(company, nil, 0)
    travel_to 89.days.ago do
      create_job(company, nil, 89)
    end
    travel_to 90.days.ago do
      create_job(company, nil, 90)
    end
    travel_to 91.days.ago do
      create_job(company, nil, 91)
    end
    travel_to 100.days.ago do
      create_job(company, nil, 100)
    end

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content company.location

    days.each do |day|
      if day < 90
        expect(page).to have_content "Macro Job #{day}"
      else
        expect(page).to_not have_content "Macro Job #{day}"
      end
    end

  end

  scenario 'on category page' do
    category = create_category(5)

    days = [0,89,90,91,100]

    create_job(nil, category, 0)
    travel_to 89.days.ago do
      create_job(nil, category, 89)
    end
    travel_to 90.days.ago do
      create_job(nil, category, 90)
    end
    travel_to 91.days.ago do
      create_job(nil, category, 91)
    end
    travel_to 100.days.ago do
      create_job(nil, category, 100)
    end


    visit category_path(category)

    expect(page).to have_content category.name

    days.each do |day|
      if day < 90
        expect(page).to have_content "Macro Job #{day}"
      else
        expect(page).to_not have_content "Macro Job #{day}"
      end
    end
  end

end
