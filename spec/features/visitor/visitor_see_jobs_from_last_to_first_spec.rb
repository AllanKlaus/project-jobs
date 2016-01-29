require 'rails_helper'

feature 'Visitor see jobs from last to first' do
  scenario 'on home' do
    5.times do |number|
      create_job(title: "Macro Job #{number}")
    end

    visit root_path

    within first('div.job') do
      expect(page).to have_content('Macro Job 4')
    end

    within first('div.job:last-child') do
      expect(page).to have_content('Macro Job 0')
    end
  end

  scenario 'on jobs index' do
    5.times do |number|
      create_job(title: "Macro Job #{number}")
    end

    visit jobs_path

    within first('div.job') do
      expect(page).to have_content('Macro Job 4')
    end

    within first('div.job:last-child') do
      expect(page).to have_content('Macro Job 0')
    end
  end
end
