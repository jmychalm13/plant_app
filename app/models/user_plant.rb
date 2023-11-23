class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :zone
  has_many :watering_schedules
  has_many :fertilizer_schedules
  has_many :care_instructions
  has_many :cuttings
  belongs_to :type

  def get_care_instructions

  end

end
