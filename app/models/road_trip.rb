class RoadTrip < ApplicationRecord
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :api_key, presence: true

  def self.api_error
    {
        :error_message => "Must use a valid API key for request"
    }
  end
end