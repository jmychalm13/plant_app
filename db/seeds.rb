puts "Seeding Started"

User.create!(
  first_name: "Jane",
  last_name: "Test",
  email: "jane@test.com",
  password: "password",
  password_confirmation: "password",
)

UserPlant.create!(
  user_id: 1,
  plant_id: 1,
  zone_id: 1,
  type_id: 1,
  name: "Montera Delicioso",
  img_url: "test.jpg",
)

Zone.create!(
  user_id: 1,
  location_name: "Living Room",
  light_level: "medium",
)

WateringSchedule.create!(
  user_plant_id: 1,
)

FertilizerSchedule.create!(
  user_plant_id: 1,
)

CareInstruction.create(
  user_plant_id: 1,
  instructions: "water when thirsty/droopy"
)

Type.create!([
  {type_name: "monstera"},
  {type_name: "philodendron"},
  {type_name: "calathea"},
])


puts "Seeding complete! Fuck yeah!"