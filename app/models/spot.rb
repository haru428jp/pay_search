class Spot < ApplicationRecord
  belongs_to :user
  has_many :spot_tags
  has_many :tags, through: :spot_tags

  with_options presence: true do
    validates :name
    validates :address
    validates :latitude
    validates :longitude
  end

end
