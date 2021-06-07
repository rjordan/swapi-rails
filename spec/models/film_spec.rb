# frozen_string_literal: true

require "spec_helper"

RSpec.describe Film, type: :model do
  it { is_expected.not_to allow_value(nil, "").for(:title) }
  it { is_expected.not_to allow_value(nil, "").for(:opening_crawl) }
  it { is_expected.not_to allow_value(nil, "").for(:director) }
  it { is_expected.not_to allow_value(nil, "").for(:producer) }
  it { is_expected.not_to allow_value(nil, "").for(:release_date) }
  it { is_expected.not_to allow_value(nil, "").for(:imdb_url) }

  it { is_expected.to have_and_belong_to_many(:starships) }
end
