class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel
  has_one :rate
end
