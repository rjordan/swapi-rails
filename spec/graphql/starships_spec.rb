# frozen_string_literal: true

require "spec_helper"

RSpec.describe SwapiSchema, type: :model do
  let(:graphql_result) do
    res = described_class.execute(
      query,
      variables: variables,
      context: context
    )
    expect(res["errors"]).to be_nil
    res
  end
  let(:context) do
    {}
  end
  let(:variables) do
    {}
  end
  let(:query) do
    <<~GRAPHQL
      query {
        starships (first: #{per_page}) {
          pageInfo {
            startCursor
            endCursor
            hasNextPage
            hasPreviousPage
          }
          nodes {
            id
            name
            manufacturer
            model
            starshipClass
            costInCredits
            length
            MGLT
            maxAtmosphericSpeed
            hyperdriveRating
            crew
            passengers
            consumables
            cargoCapacity
            films {
              nodes {
                id
                title
              }
            }
          }
        }
      }
    GRAPHQL
  end
  let(:per_page) { 10 }
  let(:valid_result) do
    {
      "pageInfo" => {
        "startCursor" => instance_of(String),
        "endCursor" => instance_of(String),
        "hasNextPage" => true,
        "hasPreviousPage" => false
      },
      "nodes" => starships[0...per_page].map do |starship|
                   {
                     "id" => starship.id,
                     "name" => starship.name,
                     "manufacturer" => starship.manufacturer,
                     "model" => starship.model,
                     "starshipClass" => starship.starship_class,
                     "costInCredits" => starship.cost_in_credits,
                     "length" => starship.length,
                     "MGLT" => starship.mglt,
                     "maxAtmosphericSpeed" => starship.max_atmospheric_speed,
                     "hyperdriveRating" => starship.hyperdrive_rating,
                     "crew" => starship.crew,
                     "passengers" => starship.passengers,
                     "consumables" => starship.consumables,
                     "cargoCapacity" => starship.cargo_capacity,
                     "films" => {
                       "nodes" => starship.films.map do |film|
                                    {
                                      "id" => film.id,
                                      "title" => film.title
                                    }
                                  end
                     }
                   }
                 end
    }
  end
  let!(:starships) { FactoryBot.create_list(:starship, per_page * 2) }

  it { expect(graphql_result["data"]["starships"]).to match(valid_result) }
end
