class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options presence: true do
    validates :name
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
  end

  has_many :spots
  has_many :comments
end
