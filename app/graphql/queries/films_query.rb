# frozen_string_literal: true

module Queries
  # List all films
  module FilmsQuery
    def self.included(base)
      base.class_eval do
        field :films, Types::Film.connection_type, description: "List of films", null: true
      end
    end

    def films
      Film.all
    end
  end
end
