require 'rails_helper'

describe 'User deletes an existing job' do
  scenario 'a user can delete a job' do
    company = Company.create(name: 'Test')
    job = company.jobs.create(title: 'DevOps',
                              description: 'Something great!',
                              level_of_interest: 99,
                              city: 'Denver')
    visit company_path(company)
    within(".job_#{job.id}") do
      click_link 'delete'
    end

    
    expect(page).to have_content('DevOps at Test was successfully deleted')
  end
end
