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

  describe '#new' do
    it 'should assign an item' do
      get :new

      expect(assigns(:item)).to be_a(Item)
    end
  end

  describe '#create' do
    context 'when valid data' do
      it 'should redirect to items list' do
        post :create, {item: {name: 'book name'}}

        expect(response).to redirect_to items_path
      end

      it 'should create a new item' do
        expect do
          post :create, {item: {name: 'book name'}}
        end.to change { Item.count }.by(1)

        expect(Item.last.name).to eq 'book name'
      end
    end

    context 'when invalid data' do
      it 'should assign an item' do
        post :create, {item: {name: ''}}

        expect(assigns(:item)).to be_a(Item)
      end

      it 'should render new page' do
        post :create, {item: {name: ''}}

        expect(response).to render_template(:new)
      end

      it 'should not create new item' do
        expect do
          post :create, {item: {name: ''}}
        end.to_not change { Item.count }
      end
    end
  end
end