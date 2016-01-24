# Project Find Jobs
I'm learning Ruby on Rails and this is my first project.

It's a website that any user logged user can create and edit jobs

Gems used on project
  - Bootstrap (CSS)
  - Devise (Login User)
  - Paperclip (Upload Image)
  - Rspec (TDD)

Things I'm planning to do
- Tests to check validation on forms
- Expire jobs that not was updated in 90 days - OK
- Search on Jobs - OK
- When user is logged show option to edit jobs, categories and companies when it is showing. Ex.: job_path(job)
- Order Jobs from last to first - OK

Could do better at the end of the Project
- On "remove" expired jobs from views SHOULD use where on controller to get only not expired, SQLITE don't have a function like ADDATE (MySQL) to filter it on where, in this project I used only a if to see.

Doubts I had during the project
- 1- How to DRY on Rspec, using methods of Rspec
- 2- Locals var in render isn't passing on companies_path, company_path, categories_path, category_path (commented on code)
- 3- How to put form_for in layouts/application.html.erb

Response
- 1- You can use Macros to DRY on Rspec,the methods (have_content, click_on, etc) work fine.
- 2- ?
- 3- ?
