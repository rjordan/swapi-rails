# frozen_string_literal: true

Starship.find_or_create_by!(name: "CR90 corvette") do |s|
  s.starship_class = "corvette"
  s.model = "CR90 corvette"
  s.manufacturer = "Corellian Engineering Corporation"
  s.cost_in_credits = 3_500_000.6
  s.length = 150
  s.max_atmospheric_speed = 950
  s.crew = 165
  s.passengers = 600
  s.cargo_capacity = 3_000_000
  s.consumables = "1 year"
  s.hyperdrive_rating = 2.0
  s.mglt = 60
end
