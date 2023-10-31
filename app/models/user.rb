class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options presence: true do
    validates :name
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英字と半角数字の両方を含めてください' }
  end

  has_one_attached :image
  has_many :spots
  has_many :comments
end
