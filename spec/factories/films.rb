# frozen_string_literal: true

FactoryBot.define do
  factory :film do
    transient do
      starship_count { 1 }
    end
    title { Faker::Movie.title }
    episode_id { Faker::Number.positive }
    opening_crawl { Faker::Lorem.paragraphs(number: 2..5) }
    director { Faker::Name.name }
    producer { Faker::Name.name }
    release_date { Faker::Time.between_dates(from: 1.year.ago, to: 10.years.ago) }
    imdb_url { Faker::Internet.url }
    facts do
      [].tap do |a|
        Faker::Number.within(range: 0..6).times do
          a.concat Faker::Lorem.paragraphs(number: 1..3)
        end
      end
    end

    after(:create) do |film, evaluator|
      FactoryBot.create_list(:starship, evaluator.starship_count, films: [film], film_count: 0)
    end
  end
end
