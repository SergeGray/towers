require 'rails_helper'

RSpec.describe Faction, type: :model do
  subject(:faction) { create(:faction) }

  it { is_expected.to have_many(:card_factions).dependent(:destroy) }
  it { is_expected.to have_many(:cards).through(:card_factions) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
