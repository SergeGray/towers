class Deck < ApplicationRecord
  validates :name, presence: true
end
