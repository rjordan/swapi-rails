# frozen_string_literal: true

require "spec_helper"

RSpec.describe SwapiSchema, type: :model do
  let(:variables) do
    {
      starshipId: starship.id
    }
  end
  let(:context) { {} }
  let(:graphql_result) do
    res = described_class.execute(
      query,
      variables: variables,
      context: context
    )
    expect(res["errors"]).to be_nil
    res
  end
  let(:query) do
    <<~GRAPHQL
      query ($starshipId:String!) {
        starship (id: $starshipId) {
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
        }
      }
    GRAPHQL
  end
  let(:valid_result) do
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
      "cargoCapacity" => starship.cargo_capacity
    }
  end
  let(:starship) { FactoryBot.create(:starship) }

  it { expect(graphql_result["data"]["starship"]).to match(valid_result) }
end
