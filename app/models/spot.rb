class Spot < ApplicationRecord
  geocoded_by :address
  before_save :geocode_if_address_changed

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

  def geocode_if_address_changed
    if will_save_change_to_address?
      geocode
    end
  end

  def geocode_must_be_present
    if latitude.blank? || longitude.blank?
      errors.add(:address, "に正しい住所を入力してください。")
    end
  end

end
