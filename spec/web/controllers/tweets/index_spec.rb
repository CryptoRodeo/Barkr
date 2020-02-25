RSpec.describe Web::Controllers::Tweets::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) {TweetRepository.new}

  before do
    repository.clear

    @tweet = repository.create(username:'Fido', content: 'Scooby do is overrated')
      puts "~~~~#{repository.class}"
    end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)

  end

  it 'exposes all tweets' do
    action.call(params)
    expect(action.exposures[:tweets]).to eq([@tweet])
  end
end
