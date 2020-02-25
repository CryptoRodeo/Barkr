RSpec.describe Web::Views::Tweets::Index, type: :view do
  let(:exposures) { Hash[ tweets: [] ] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/tweets/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #tweets' do
    expect(view.tweets).to eq(exposures.fetch(:tweets))
  end

  context 'When there are no tweets' do
    it 'shows a placeholder' do
      expect(rendered).to include ("<p class='placeholder'>Be the first to tweet on Barkr!</p>")
    end
  end

    context 'When there are tweets' do
      let(:tweet1)    { Tweet.new(username: 'Fido', content: "Scooby doo is overrated") }
      let(:tweet2)    { Tweet.new(username: 'Scooby', content: 'I dont even know who this Fido guy is!') }
      let(:exposures) { Hash[tweets: [tweet1, tweet2 ] ] }

      it 'lists them all' do
        expect(rendered.scan(/class="tweet"/).length).to eq(2)
        expect(rendered).to include("Scooby doo is overrated")
        expect(rendered).to include("I dont even know who this Fido guy is!")
      end

      it 'hides the place holder message' do 
        expect(rendered).to_not include("<p class='placeholder'>Be the first to tweet on Barkr!</p>")
    end
  end
end