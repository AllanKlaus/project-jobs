module ModelsMacros
  def create_company(attrs = {})
    Company.create({name: "Creating Company",
    location: 'Guarujá',
    phone: '11 2369 3476',
    mail: "mail@mail.com"}.merge(attrs))
  end

  def create_category(attrs = {})
    Category.create({name: "Creating Category"}.merge(attrs))
  end

  def create_job(attrs = {})
    attrs[:company] ||= create_company
    attrs[:category] ||= create_category
    Job.create({
    title: "Macro Job",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    location: 'São Paulo - SP'}.merge(attrs))
  end

  def login_user
    user = create_user

    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: set_password

    click_on 'Log in'
  end

  def create_user
    User.create(
    email: 'admin@user.com',
    password: set_password,
    password_confirmation: set_password
    )
  end

  def set_password
    '12346578'
  end
end
