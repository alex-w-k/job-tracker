require 'rails_helper'

describe 'User creates a new comment' do
  scenario 'a user can add a comment' do
    company = Company.create(name: 'Test')
    job = company.jobs.create(title: 'DevOps',
                              description: 'Something great!',
                              level_of_interest: 99,
                              city: 'Denver')
    visit company_job_path(company, job)
    fill_in "comment[title]", with: "Comment Title!"
    fill_in "comment[body]", with: 'Comment Body'
    click_on 'Submit'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content('Comment Title!')
    expect(page).to have_content('Comment Body')
  end
end
