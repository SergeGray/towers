require 'rails_helper'
include Dry::Monads[:result]

RSpec.describe Games::Initialize do
  describe '.call' do
    let(:card_ids) { [1, 2, 3] }
    let(:user) { create(:user) }
    let(:first_player) { true }

    context "When player initialization is successful" do
      it "creates a game" do
        allow(Players::Initialize).to receive(:call).and_return(Success())

        result = described_class.call(card_ids:, user:, first_player:)

        expect(result).to be_success
        expect(result.success).to be_an_instance_of(Game)
        expect(Players::Initialize).to have_received(:call)
      end
    end

    context "When player initialization is unsuccessful" do
      it "does not create a game" do
        allow(Players::Initialize).to receive(:call).and_return(Failure("some error"))

        result = described_class.call(card_ids:, user:, first_player:)

        expect(result).to be_failure
        expect(result.failure).to eq("some error")
        expect(Game.count).to eq(0)
        expect(Players::Initialize).to have_received(:call)
      end
    end
  end
end
