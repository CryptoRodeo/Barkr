RSpec.describe Web::Controllers::Tweets::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[tweet: { username: 'Demo Doggo', content: 'Woof?'}] }
  let(:repository) {TweetRepository.new}

  before do
    repository.clear
  end

  it 'creates a tweet' do
    action.call(params)
    tweet = repository.last

    expect(tweet.id).to_not be_nil
  end

  it 'redirects the user to the index tweet page' do
    response = action.call(params)
    
    response = action.call(params)
    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq('/tweets')
  end
end
