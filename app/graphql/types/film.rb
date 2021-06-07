# frozen_string_literal: true

module Types
  # GraphQL Starship type
  class Film < BaseObject
    description "A film in the StarWars universe"
    field :id, ID, null: false
    field :title, String, "The title of the film", null: false
    field :opening_crawl, String, "The text at the beginning of the film", null: false
    field :director, String, "The director of the film", null: false
    field :producer, String, "The producer of the film", null: false
    field :release_date, String, "The original date of release", null: false
    field :imdb_url, String, "A link to the film on IMDB", null: false
    field :facts, [String], "Facts about the film", null: false
    field :starships, Types::Starship.connection_type, "Starships appearing in this film", null: false
  end
end
