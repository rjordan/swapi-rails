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
        films (first: #{per_page}) {
          pageInfo {
            startCursor
            endCursor
            hasNextPage
            hasPreviousPage
          }
          nodes {
            id
            title
            openingCrawl
            director
            producer
            releaseDate
            imdbUrl
            # facts
            starships {
              nodes {
                id
                name
              }
            }
          }
        }
      }
    GRAPHQL
  end
  let(:per_page) { 1 }
  let(:valid_result) do
    {
      "pageInfo" => {
        "startCursor" => instance_of(String),
        "endCursor" => instance_of(String),
        "hasNextPage" => true,
        "hasPreviousPage" => false
      },
      "nodes" => films[0...per_page].map do |film|
                   {
                     "id" => film.id,
                     "title" => film.title,
                     "openingCrawl" => film.opening_crawl,
                     "director" => film.director,
                     "producer" => film.producer,
                     "releaseDate" => film.release_date,
                     "imdbUrl" => film.imdb_url,
                     # "facts" => film.facts,
                     "starships" => {
                       "nodes" => film.starships.map do |starship|
                         {
                           "id" => starship.id,
                           "name" => starship.name
                         }
                       end
                     }
                   }
                 end
    }
  end
  let!(:films) { FactoryBot.create_list(:film, per_page * 2) }

  it { expect(graphql_result["data"]["films"]).to match(valid_result) }
end
