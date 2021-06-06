# frozen_string_literal: true

module Queries
  # List all starships
  module StarshipsQuery
    def self.included(base)
      base.class_eval do
        field :starships, Types::Starship.connection_type, description: "List of starships", null: true
      end
    end

    def starships
      Starship.all
    end
  end
end
