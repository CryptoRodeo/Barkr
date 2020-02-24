RSpec.describe Tweet, type: :entity do
  it 'can be initialized with attributes' do
    tweet = Tweet.new(username: 'Doggo') 
    expect(tweet.username).to eq('Doggo')
  end
end
