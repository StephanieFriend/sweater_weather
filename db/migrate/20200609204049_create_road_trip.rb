class CreateRoadTrip < ActiveRecord::Migration[5.2]
  def change
    create_table :road_trips do |t|
      t.string :origin
      t.string :destination
      t.string :api_key
    end
  end
end
