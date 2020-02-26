require 'features_helper'

RSpec.describe 'Add a tweet' do
  after do
    TweetRepository.new.clear
  end

  it 'displays a list of errors when params contains errors' do
    visit '/tweets/new'

    within 'form#tweet-form' do
      click_button 'Tweet'
    end

    expect(current_path).to eq('/tweets')


    expect(page).to have_content('There was a problem with your tweet')
    expect(page).to have_content('Username must be filled')
    expect(page).to have_content('Content must be filled')
  end
end
