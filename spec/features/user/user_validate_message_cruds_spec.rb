require 'rails_helper'

feature 'Validate all cruds' do
  scenario 'jobs' do
    login_user

    visit new_job_path
    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

  scenario 'company' do
    login_user

    visit new_company_path
    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

  scenario 'invalid category' do
    login_user

    visit new_category_path
    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end
end
