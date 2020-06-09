class UserResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :api_key , if: Proc.new { |record| record.id }
  attribute :error_message, if: Proc.new { |record| record.error_message }
end
