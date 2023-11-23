class Zone < ApplicationRecord
  belongs_to :user
  has_many :user_plants
  has_many :cuttings
end
