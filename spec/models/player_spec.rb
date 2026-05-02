require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:user).optional }
end
