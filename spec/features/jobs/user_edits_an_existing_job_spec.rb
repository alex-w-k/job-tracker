require 'rails_helper'

describe 'User edits an existing job' do
  scenario 'a user can edit a job' do
    company = Company.create(name: 'Test')
    job = company.jobs.create(title: 'DevOps',
                              description: 'Something great!',
                              level_of_interest: 99,
                              city: 'Denver')
    visit root_path
    click_on(company.name)
    within(".job_#{job.id}") do
      click_on('mode_edit')
    end

    expect(current_path).to eq(edit_company_job_path(company, job))

    fill_in 'job[title]', with: 'OtherTitle'
    fill_in 'job[description]', with: 'A Great Job!'
    fill_in 'job[level_of_interest]', with: 85
    fill_in 'job[city]', with: 'Austin'

    click_button 'Submit'

    expect(page).to have_current_path(company_job_path(company, job))
    expect(page).to have_content('OtherTitle')
    expect(page).to_not have_content('DevOps')
    expect(page).to have_content('A Great Job!')
    expect(page).to_not have_content('Something great!')
    expect(page).to have_content('85')
    expect(page).to_not have_content('99')
    expect(page).to have_content('Austin')
    expect(page).to_not have_content('Denver')
  end
end
