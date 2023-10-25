class Tag < ApplicationRecord
  has_many :spot_tags
  has_many :spots, through: :spot_tags

  validates :name, presence: true
end
