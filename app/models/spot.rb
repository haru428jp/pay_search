class Spot < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :address
    validates :latitude
    validates :longitude
  end

end
