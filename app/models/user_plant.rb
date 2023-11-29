class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :zone
  has_many :watering_schedules
  has_many :fertilizer_schedules
  has_many :care_instructions
  has_many :cuttings
  belongs_to :type

  def zone_name
    id = zone_id
    zone = Zone.find(id)
    return zone.location_name
  end

  def type_name
    id = type_id
    type = Type.find(id)
    return type.type_name
  end
end
