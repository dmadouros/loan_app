require 'rails_helper'

describe ItemsController, type: :controller do
  before do
    @user = User.create!(email: 'test@example.com', password: 'password')
    sign_in @user
  end

  it_should_behave_like 'an authenticating controller' do
    before { sign_out @user }
    let(:controller_action) { :index }
  end

  describe '#index' do
    it 'should assign items' do
      item = Item.create(name: 'Sample item')

      get :index

      expect(assigns(:items)).to eq [item]
    end
  end
end