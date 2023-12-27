class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :zone
  has_many :watering_schedules
  has_many :fertilizer_schedules
  has_many :care_instructions
  has_many :cuttings
  belongs_to :type

 def zone_name
  zone.location_name if zone
 end

 def type_name
   type.type_name if type
 end

end
