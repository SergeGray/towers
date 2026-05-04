require 'rails_helper'

RSpec.describe "Games", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    it "returns a success response" do
      get games_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:game) { create(:game) }

    it "returns a success response" do
      get game_path(game)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns a success response" do
      get new_game_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "creates a new game" do
      post games_path, params: { game: { state: :pending, first_player_turn: true } }
      expect(response).to redirect_to game_path(Game.last)
    end
  end
end
