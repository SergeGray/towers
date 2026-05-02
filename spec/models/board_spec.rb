require 'rails_helper'

RSpec.describe Board, type: :model do
  it { is_expected.to belong_to(:game) }

  it { is_expected.to have_many(:board_rows).dependent(:destroy) }
end
