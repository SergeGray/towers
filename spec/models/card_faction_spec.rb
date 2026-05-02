require 'rails_helper'

RSpec.describe CardFaction, type: :model do
  it { is_expected.to belong_to(:card) }
  it { is_expected.to belong_to(:faction) }
end
