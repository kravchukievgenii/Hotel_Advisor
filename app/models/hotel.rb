require 'carrierwave/orm/activerecord'
class Hotel < ActiveRecord::Base
  mount_uploader :photo, HotelPhotoUploader
  belongs_to :user
  has_one :address
  has_many :comments
  accepts_nested_attributes_for :address
  letsrate_rateable "stars"
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: true
  validates :room_description, length: { minimum: 20 }
end
