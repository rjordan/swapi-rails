# frozen_string_literal: true

module Types
  # GraphQL Starship type
  class Starship < BaseObject
    description "A starship"
    field :id, ID, null: false
    field :name, String, "The starship name", null: false
    field :model, String, "The model of the starship", null: false
    field :MGLT, Float, "No idea", null: false
    field :cargo_capacity, Integer, "Cargo capacity in m2", null: false
    field :consumables, String, "Provisions available for standard crew/passenger compliment", null: false
    field :cost_in_credits, Integer, "The cost of the ship in creditss", null: false
    field :crew, Integer, "Number of crew supported by this starship", null: false
    field :hyperdrive_rating, Float, "Hyperdrive multiplier", null: false
    field :length, Float, "Length of the vessel in meters", null: false
    field :manufacturer, String, "The manufacturer of this starship", null: false
    field :max_atmospheric_speed, Float, "The max airspeed in m/s", null: false
    field :passengers, Integer, "The maximum number of passengers", null: false
    field :starship_class, String, "The starship class", null: false
    # t.timestamps
    field :films, Types::Film.connection_type, "Films this starship appears in", null: false

    def self.resolve_reference(reference, _context)
      Starship.find(reference[:id])
    end
  end
end
