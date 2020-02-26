require 'features_helper'

RSpec.describe 'Add a tweet' do
  after do
    TweetRepository.new.clear
  end

  it 'can create a new tweet' do
    visit '/tweets/new'

    within 'form#tweet-form' do
      fill_in 'Username', with: 'Demo Doggo'
      fill_in 'Content', with: 'Woof'

      click_button 'Tweet'
    end


    expect(page).to have_current_path('/tweets')
    expect(page).to have_content('Demo Doggo')
  end
end
