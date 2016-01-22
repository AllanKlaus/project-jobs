module ModelsMacros
  def create_company(number = nil)
    Company.create(name: "Creating Company #{number}",
                   location: 'Guarujá',
                   phone: '11 2369 3476',
                   mail: "created#{number}@mail.com")
  end

  def create_category(number = nil)
    Category.create(name: "Category #{number}")
  end

  def create_job(company = nil, category = nil, number = nil)
    company ||= create_company(number)
    category ||= create_category(number)
    company.jobs.create(title: "Macro Job #{number}",
               description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
               location: 'São Paulo - SP',
               category: category)
  end
end
