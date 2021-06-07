# frozen_string_literal: true

class Starship < ApplicationRecord
  validates :name, presence: true
  validates :model, presence: true
  validates :consumables, presence: true
  validates :manufacturer, presence: true
  validates :starship_class, presence: true

  validates :cargo_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cost_in_credits, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :crew, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :passengers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :mglt, presence: true, numericality: { greater_than: 0 }
  validates :hyperdrive_rating, presence: true, numericality: { greater_than: 0, less_than: 10 }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :max_atmospheric_speed, presence: true, numericality: { greater_than: 0 }

  has_and_belongs_to_many :films

  # Fix issue with ruby constants
  alias_attribute :MGLT, :mglt
end
