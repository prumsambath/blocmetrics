require 'rails_helper'

describe 'Welcome page' do
  it 'shows the welcome page when user jumps in' do
    visit root_path

    expect(page).to have_content('Blocmetrics: API Tracking Service and Reporting Tool')
  end
end
