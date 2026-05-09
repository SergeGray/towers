require 'rails_helper'

RSpec.describe GameTurn, type: :model do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:targetable) }
  it { is_expected.to belong_to(:originable) }
  it { is_expected.to belong_to(:destinationable) }
end
