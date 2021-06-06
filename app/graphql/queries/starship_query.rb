# frozen_string_literal: true

module Queries
  # Find a single starship
  module StarshipQuery
    def self.included(base)
      base.class_eval do
        field :starship, Types::Starship, description: "The starship", null: true do
          argument :id, String, required: true
        end
      end
    end

    def starship(id:)
      Starship.find(id)
    end
  end
end
