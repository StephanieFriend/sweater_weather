class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :weather_forecast
end
