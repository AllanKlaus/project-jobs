require 'rails_helper'

feature 'Visitor select contract type' do
  scenario 'See contract type on home' do
    visit root_path

    Job::CONTRACT_TYPE.each do |contract|
      expect(page).to have_content contract
    end
  end

  scenario 'Click on contract type on home' do
    jobs = []
    Job::CONTRACT_TYPE.each do |contract|
      jobs << create_job(title: "Job with contract #{contract}", contract: contract)
    end

    visit root_path

    click_on Job::CONTRACT_TYPE.first

    expect(page).to have_content jobs[0].title
    expect(page).to_not have_content jobs[1].title
    expect(page).to_not have_content jobs[2].title
  end
end
