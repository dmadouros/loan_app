require 'rails_helper'

describe ItemsController, type: :controller do
  describe '#index' do
    it 'should assign items' do
      item = Item.create(name: 'Sample item')

      get :index

      expect(assigns(:items)).to eq [item]
    end
  end
end