RSpec.describe Web::Views::Tweets::New, type: :view do
  let(:params) {OpenStruct.new(valid?: false, error_messages: ['Username must be filled', 'Content must be filled'])}
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/tweets/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('There was a problem with your tweet')
    expect(rendered).to include('Username must be filled')
    expect(rendered).to include('Content must be filled')
  end
end
