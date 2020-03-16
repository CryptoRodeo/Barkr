require 'features_helper'

RSpec.describe 'lists tweets' do
   let(:repository) {TweetRepository.new}
   let(:user_repository) {UserRepository.new}
   let(:user) {user_repository.find_by_ip('127.0.0.1')}
  before do
    repository.clear

    repository.create(user_id: user.id, content: 'Hungry for snacks...')
    repository.create(user_id: user.id, content: 'Just found out im adopted!')
  end

  it 'Displays the tweets on the page' do
    visit '/tweets'

    #within an element with the id of tweets
    within '#tweets' do
      #expect to find two elements with the class of tweet
      expect(page).to have_selector('.tweet', count:2)
    end
  end
end
