require 'rails_helper'

RSpec.describe PlayCard, type: :model do
  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:card) }
end
