# frozen_string_literal: true

FactoryBot.define do
  factory :starship do
    transient do
      film_count { 1 }
    end
    name { [[Faker::Adjective.positive, Faker::Adjective.negative].sample, Faker::Creature::Animal.name].join(" ") }
    manufacturer { Faker::Device.manufacturer }
    model { Faker::Device.model_name }
    starship_class { Faker::Device.platform }
    consumables { "1 year" }
    cargo_capacity { Faker::Number.within(range: 10..999_999) }
    cost_in_credits { Faker::Number.within(range: 100_000..999_999_999) }
    crew { Faker::Number.within(range: 1..999) }
    passengers { Faker::Number.within(range: 0..99_999) }
    mglt { Faker::Number.decimal(l_digits: 4, r_digits: 1) }
    hyperdrive_rating { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    length { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    max_atmospheric_speed { Faker::Number.decimal(l_digits: 4, r_digits: 2) }

    after(:create) do |starship, evaluator|
      FactoryBot.create_list(:film, evaluator.film_count, starships: [starship], starship_count: 0)
    end
  end
end
