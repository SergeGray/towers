require 'rails_helper'

RSpec.describe DiscardPile, type: :model do
  it { is_expected.to belong_to(:player) }
end
