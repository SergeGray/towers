require 'rails_helper'

RSpec.describe "Decks", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get decks_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "returns a success response" do
        get decks_path
        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    let(:deck) { create(:deck, user: user) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get deck_path(deck)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "returns a success response" do
        get deck_path(deck)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /new" do
    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get new_deck_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "returns a success response" do
        get new_deck_path
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        post decks_path, params: { deck: { name: "Test Deck" } }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "creates a new deck" do
        post decks_path, params: { deck: { name: "Test Deck" } }
        expect(response).to redirect_to deck_path(Deck.last)
      end
    end
  end

  describe "GET /edit" do
    let(:deck) { create(:deck, user: user) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get edit_deck_path(deck)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "returns a success response" do
        get edit_deck_path(deck)
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    let(:deck) { create(:deck, user: user) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        patch deck_path(deck), params: { deck: { name: "Test Deck" } }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "updates the deck" do
        patch deck_path(deck), params: { deck: { name: "Test Deck" } }
        expect(response).to redirect_to deck_path(deck)
      end
    end
  end

  describe "DELETE /destroy" do
    let(:deck) { create(:deck, user: user) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        delete deck_path(deck)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "deletes the deck" do
        delete deck_path(deck)
        expect(response).to redirect_to decks_path
      end
    end
  end
end
