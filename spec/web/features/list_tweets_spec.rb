require 'features_helper'

RSpec.describe 'lists tweets' do
  it 'displays the tweets' do
    visit '/tweets'
    
    #within an element with the id of tweets
    within '#tweets' do
      #expect to find two elements with the class of tweet
      expect(page).to have_css('.tweet', count:2)
    end
  end
end
