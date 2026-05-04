require 'rails_helper'

RSpec.describe "Cards", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    it "returns a success response" do
      get cards_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:card) { create(:card) }

    it "returns a success response" do
      get card_path(card)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get new_card_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "returns a success response" do
        get new_card_path
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        post cards_path, params: { card: { name: "Test Card", description: "Test Description", action: :defense, rarity: :common, strength: 5 } }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "creates a new card" do
        post cards_path, params: { card: { name: "Test Card", description: "Test Description", action: :defense, rarity: :common, strength: 5 } }
        expect(response).to redirect_to card_path(Card.last)
      end
    end
  end

  describe "GET /edit" do
    let(:card) { create(:card) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get edit_card_path(card)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "returns a success response" do
        get edit_card_path(card)
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    let(:card) { create(:card) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        patch card_path(card), params: { card: { name: "Test Card", description: "Test Description", action: :defense, rarity: :common, strength: 5 } }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "updates the card" do
        patch card_path(card), params: { card: { name: "Test Card", description: "Test Description", action: :defense, rarity: :common, strength: 5 } }
        expect(response).to redirect_to card_path(card)
      end
    end
  end

  describe "DELETE /destroy" do
    let(:card) { create(:card) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        delete card_path(card)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "deletes the card" do
        delete card_path(card)
        expect(response).to redirect_to cards_path
      end
    end
  end
end
