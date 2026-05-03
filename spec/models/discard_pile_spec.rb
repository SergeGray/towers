require 'rails_helper'

RSpec.describe DiscardPile, type: :model do
  it { is_expected.to belong_to(:player) }
  it { is_expected.to have_many(:play_cards).dependent(:destroy) }
end
