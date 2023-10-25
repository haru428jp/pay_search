class Spot < ApplicationRecord
  geocoded_by :address
  before_validation :geocode, if: :will_save_change_to_address?

  validate :geocode_must_be_present

  with_options presence: true do
    validates :name
    validates :address
    validates :tag_ids
  end

  belongs_to :user
  has_many :spot_tags
  has_many :tags, through: :spot_tags

  private

  def geocode_must_be_present
    if latitude.blank? || longitude.blank?
      errors.add(:address, "に関する入力をしてください。")
    end
  end

end
