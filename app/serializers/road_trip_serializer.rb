class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination , if: Proc.new { |record| record.id }
  attribute :error_message, if: Proc.new { |record| record.error_message }
end