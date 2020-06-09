class RoadTrip < ApplicationRecord
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :api_key, presence: true
end