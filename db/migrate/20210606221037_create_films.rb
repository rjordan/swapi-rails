# frozen_string_literal: true

class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films, id: :uuid do |t|
      t.string :title, null: false
      t.text :opening_crawl, null: false
      t.string :director, null: false
      t.string :producer, null: false
      t.datetime :release_date, null: false
      t.string :imdb_url, null: false
      t.text :facts, null: false, array: true, default: []
      t.timestamps
    end

    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :films_starships, primary_key: %i[film_id starship_id], id: false do |t|
      t.uuid :film_id, null: false, foreign_key: true
      t.uuid :starship_id, null: false, foreign_key: true
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end
