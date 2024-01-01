require "test_helper"

class UserPlantTest < ActiveSupport::TestCase
  test "zone_name if zone present" do
    zone = Zone.create(location_name: "Test Zone")
    user_plant = UserPlant.create(zone: zone)

    assert_equal "Test Zone", user_plant.zone_name
  end

  test "zone_name if zone nil" do
    user_plant = UserPlant.create(zone: nil)

    assert_nil user_plant.zone_name
  end

  test "type_name if type present" do
    type = Type.create(type_name: "Test Type")
    user_plant = UserPlant.create(type: type)

    assert_equal "Test Type", user_plant.type_name
  end

  test "type_name if type nil" do
    user_plant = UserPlant.create(type: nil)

    assert_nil user_plant.zone_name
  end
end
