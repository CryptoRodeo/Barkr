RSpec.describe Tweet, type: :entity do
  it 'can be initialized with attributes' do
    tweet = Tweet.new(content: "Hello!")
    expect(tweet.content).to eq("Hello!")
  end
end
