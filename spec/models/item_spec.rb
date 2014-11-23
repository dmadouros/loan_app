require 'rails_helper'

describe Item do

  let(:item) { Item.new(name: 'The Bible') }

  it 'should be valid' do
    expect(item).to be_valid
  end

  context 'when name is blank' do
    it 'should not be valid' do
      item.name = ''
      expect(item).to_not be_valid

      expect(item.errors[:name]).to include "can't be blank"
    end
  end
end