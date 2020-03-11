RSpec.describe User, type: :entity do
  it 'can be initialized with attributes' do
    user = User.new(id: "1234")
    expect(user.id).to eq("1234")
  end
end
