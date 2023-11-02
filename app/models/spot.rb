class Spot < ApplicationRecord
  geocoded_by :address
  before_validation :geocode_if_address_changed

  with_options presence: true do
    validates :name
    validates :address
    validates :tag_ids
  end

  validate :geocode_must_be_present

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :spot_tags
  has_many :tags, through: :spot_tags

  def self.search(search)
    if search != ''
      Spot.where('name LIKE(?)', "%#{search}%")
    else
      Spot.all
    end
  end

  private

  def geocode_if_address_changed
    return unless will_save_change_to_address?

    geocode
  end

  def geocode_must_be_present
    return unless latitude.blank? || longitude.blank?

    errors.add(:address, 'は正しい情報を入力してください')
  end
end
