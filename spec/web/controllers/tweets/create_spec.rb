RSpec.describe Web::Controllers::Tweets::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[tweet: { username: 'Demo Doggo', content: 'Woof?'}] }
  let(:repository) {TweetRepository.new}
  let(:ip) {  "127.0.0.1" }
  before do
    repository.clear
  end

  context 'with valid params' do
    let(:params) { Hash[tweet: {username: 'Demo Doggo', content: 'Woof?'}] }

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

  context 'with invalid params' do
    let(:params) { Hash[tweet: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps error in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:tweet, :content)).to eq(['is missing'])
      expect(errors.dig(:tweet,:username)).to eq(['is missing'])
    end
  end
end
