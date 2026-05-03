require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to define_enum_for(:state).with_values(pending: 0,
                                                         in_progress: 1,
                                                         finished: 2) }

  it { is_expected.to have_many(:players).dependent(:destroy) }
  it { is_expected.to have_one(:board).dependent(:destroy) }
end
