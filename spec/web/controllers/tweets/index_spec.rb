require_relative '../../../../apps/web/controllers/tweets/index'
RSpec.describe Web::Controllers::Tweets::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:tweet_repository) {TweetRepository.new}
  let(:user_repository) {UserRepository.new}
  let(:ip) {  "127.0.0.1" }
  
  before do
    tweet_repository.clear
    user_repository.clear

    @new_user = user_repository.create(ip: ip)
    @new_tweet = tweet_repository.create(created_by: @new_user.id, content: "Hello")
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
 end

  it 'can create a user based on their ip address' do
    @new_user = user_repository.create(ip: "168.0.23.1") 

    expect(@new_user).to_not be_nil
  end

  it 'exposes all tweets' do
    action.call(params)
    expect(action.exposures[:tweets]).to eq([@new_tweet])
 end
end
