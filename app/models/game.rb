class Game < ApplicationRecord
  enum :state, { pending: 0, in_progress: 1, finished: 2 }

  has_many :players, dependent: :destroy
end
