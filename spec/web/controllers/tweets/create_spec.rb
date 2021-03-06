RSpec.describe Web::Controllers::Tweets::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash['rack.session' => session, tweet: { user_id: session[:user_id], content: 'Woof?'}] }
  let(:repository) {TweetRepository.new}
  let(:user_repo) {UserRepository.new}
  let(:user) {UserRepository.new.find_by_ip('127.0.0.1')}
  let(:user_id) { user.id }
  let(:session) { { :user_id => user.id} }


  before do
    repository.clear
  end
  context 'with valid params' do

    it 'creates a tweet' do
      action.call(params)
      tweet = repository.last

      expect(tweet.id).to_not be_nil
    end

  it 'redirects the user to the index tweet page' do
    
    response = action.call(params)
    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq('/tweets')
  end
end

  context 'with invalid params' do
    let(:params) { Hash[tweet: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end
  end
end
