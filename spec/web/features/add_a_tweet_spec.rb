require 'features_helper'

RSpec.describe 'Add a tweet' do
  after do
    TweetRepository.new.clear
  end

  it 'displays a list of errors when params contains errors' do
    visit '/tweets'

    within 'form#tweet-form' do
      click_button 'Send Bark 🐕'
    end

    expect(current_path).to eq('/tweets')


    expect(page).to have_content("There was a problem with your tweet")
  end
end
