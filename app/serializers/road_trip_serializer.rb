class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination
end