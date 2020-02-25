require 'features_helper'

RSpec.describe 'lists tweets' do
   let(:repository) {TweetRepository.new}
  before do
    repository.clear

    repository.create(username: 'Doggo', tweet: 'Hungry for snacks...')
    repository.create(username: 'Fido', tweet: 'Just found out im adopted!')
  end

  it 'Displays the tweets on the page' do
    visit '/tweets'

    #within an element with the id of tweets
    within '#tweets' do
      #expect to find two elements with the class of tweet
      expect(page).to have_css('.tweet', count:2)
    end
  end
end