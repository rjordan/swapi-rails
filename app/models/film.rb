# frozen_string_literal: true

# A film in the StarWars universe
class Film < ApplicationRecord
  validates :title, presence: true
  validates :opening_crawl, presence: true
  validates :director, presence: true
  validates :producer, presence: true
  validates :release_date, presence: true
  validates :imdb_url, presence: true

  has_and_belongs_to_many :starships

  def after_initialize(film)
    film.facts ||= []
  end
end
