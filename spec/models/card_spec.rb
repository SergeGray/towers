require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'is valid with valid attributes' do
    card = Card.new(name: 'Test Card', description: 'Test Description', strength: 10)
    expect(card).to be_valid
  end

  it 'is not valid without a name' do
    card = Card.new(description: 'Test Description', strength: 10)
    expect(card).to_not be_valid
  end

  it 'is not valid without a description' do
    card = Card.new(name: 'Test Card', strength: 10)
    expect(card).to_not be_valid
  end

  it 'is not valid with a strength less than 0' do
    card = Card.new(name: 'Test Card', description: 'Test Description', strength: -1)
    expect(card).to_not be_valid
  end
end
