require 'rails_helper'
include Dry::Monads[:result]

RSpec.describe Games::Start do
  describe '.call' do
    let(:game) { create(:game) }
    let(:card_ids) { [1, 2, 3] }
    let(:user) { create(:user) }

    context "When player initialization is successful" do
      it "changes game state to in_progress" do
        allow(Players::Initialize).to receive(:call).and_return(Success())

        result = described_class.call(game:, card_ids:, user:)

        expect(result).to be_success
        expect(result.success).to be_an_instance_of(Game)
        expect(game.reload.state).to eq('in_progress')
        expect(Players::Initialize).to have_received(:call)
      end
    end

    context "When player initialization is unsuccessful" do
      it "does not change game state" do
        allow(Players::Initialize).to receive(:call).and_return(Failure("some error"))

        result = described_class.call(game:, card_ids:, user:)

        expect(result).to be_failure
        expect(result.failure).to eq("some error")
        expect(game.reload.state).to eq('pending')
        expect(Players::Initialize).to have_received(:call)
      end
    end
  end
end
