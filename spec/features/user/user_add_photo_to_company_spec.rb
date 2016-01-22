require 'rails_helper'

feature 'User add photo to company' do

  scenario 'user create companies with photo' do
    login_user

    company = Company.create(
    name: "Creating Company",
    location: 'Guarujá',
    mail: 'created@mail.com',
    phone: '(13) 3322-2233'
    )
    visit new_company_path

    fill_in 'company[name]', with: company.name
    fill_in 'company[location]', with: company.location
    fill_in 'company[mail]', with: company.mail
    fill_in 'company[phone]', with: company.phone
    page.attach_file('company[photo]', Rails.root + 'app/assets/images/no-photo.jpg')

    click_on 'submit'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
    expect(page).to have_css("img[src*='no-photo.jpg']")
  end

  scenario 'user update company with photo' do
    login_user

    company = Company.create(
    name: "Creating Company",
    location: 'Guarujá',
    mail: 'created@mail.com',
    phone: '(13) 3322-2233'
    )

    visit edit_company_path(company)

    fill_in 'company[name]', with: company.name
    fill_in 'company[location]', with: company.location
    fill_in 'company[mail]', with: company.mail
    fill_in 'company[phone]', with: company.phone
    page.attach_file('company[photo]', Rails.root + 'app/assets/images/no-photo.jpg')

    click_on 'submit'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
    expect(page).to have_css("img[src*='no-photo.jpg']")
  end

end
