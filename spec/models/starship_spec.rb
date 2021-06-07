# frozen_string_literal: true

require "spec_helper"

RSpec.describe Starship, type: :model do
  subject { FactoryBot.create(:starship) }

  describe "#name" do
    it { is_expected.not_to allow_values(nil, "").for(:name) }
    it { is_expected.not_to allow_values(nil, "").for(:model) }
    it { is_expected.not_to allow_values(nil, "").for(:manufacturer) }
    it { is_expected.not_to allow_values(nil, "").for(:starship_class) }
    it { is_expected.not_to allow_values(nil, "").for(:consumables) }

    it { is_expected.not_to allow_values(nil, "", -1, 1.5).for(:cargo_capacity) }
    it { is_expected.not_to allow_values(nil, "", -1, 1.5, 0).for(:cost_in_credits) }
    it { is_expected.not_to allow_values(nil, "", -1, 1.5, 0).for(:crew) }
    it { is_expected.not_to allow_values(nil, "", -1, 1.5).for(:passengers) }

    it { is_expected.not_to allow_values(nil, "", -1, 0).for(:mglt) }
    it { is_expected.not_to allow_values(nil, "", -1, 0, 11).for(:hyperdrive_rating) }
    it { is_expected.not_to allow_values(nil, "", -1, 0).for(:length) }
    it { is_expected.not_to allow_values(nil, "", -1, 0).for(:max_atmospheric_speed) }

    it { is_expected.to have_and_belong_to_many(:films) }
  end
end
