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

  it 'is not valid without a strength' do
    card = Card.new(name: 'Test Card', description: 'Test Description')
    expect(card).to_not be_valid
  end

  it 'is not valid with a strength less than 1' do
    card = Card.new(name: 'Test Card', description: 'Test Description', strength: 0)
    expect(card).to_not be_valid
  end

  it 'is not valid with a strength greater than 10' do
    card = Card.new(name: 'Test Card', description: 'Test Description', strength: 11)
    expect(card).to_not be_valid
  end
end
