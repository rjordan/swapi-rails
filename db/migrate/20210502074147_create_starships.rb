# frozen_string_literal: true

class CreateStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :starships, id: :uuid do |t|
      # films
      # pilots
      t.string :name, null: false
      t.string :model, null: false
      t.float :mglt, null: false
      t.integer :cargo_capacity, null: false
      t.string :consumables, null: false
      t.integer :cost_in_credits, null: false
      t.integer :crew, null: false
      t.float :hyperdrive_rating, null: false
      t.float :length, null: false
      t.string :manufacturer, null: false
      t.float :max_atmospheric_speed, null: false
      t.integer :passengers, null: false
      t.string :starship_class, null: false
      t.timestamps
    end
  end
end
