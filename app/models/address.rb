class Address < ActiveRecord::Base
  belongs_to :hotel
  validates :country, :state, :city, :street, presence: true
end
