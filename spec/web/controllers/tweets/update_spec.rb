RSpec.describe Web::Controllers::Tweets::Update, type: :action do
  let(:action) { described_class.new }
  let(:tweet_repo) { TweetRepository.new }
  let(:user_repo) { UserRepository.new }
  let(:test_user) {user_repo.find_by_ip('127.0.0.1')}
  let(:original_tweet) { tweet_repo.create(created_by: test_user.id, content: 'testing!')}
  let(:params) { Hash[ id: original_tweet.id, tweet: original_tweet ] }
  let(:edited_tweet) { {:id => original_tweet.id, :content => "New Content" } }
  

  before do
  end

  context 'with valid params' do
    it 'gets the tweet being updated' do
        action.call(params)
        tweet = tweet_repo.last
        
        expect(tweet).to_not be_nil
    end

    it 'updates the tweet with new content' do
      tweet_repo.update(original_tweet.id,content: edited_tweet[:content])
      updated_tweet = tweet_repo.find(original_tweet.id)

      expect(updated_tweet.id).to eq(edited_tweet[:id])
      expect(updated_tweet.content).to eq(edited_tweet[:content])

    end
  end
end