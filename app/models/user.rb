class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :name, :password, presence: true
  validates :email, :name, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  has_many :decks, dependent: :destroy
end
