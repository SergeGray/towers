require 'rails_helper'

RSpec.describe "Factions", type: :request do
  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }

  describe "GET /index" do
    it "returns a success response" do
      get factions_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:faction) { create(:faction) }

    it "returns a success response" do
      get faction_path(faction)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get new_faction_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "redirects to root path" do
        get new_faction_path
        expect(response).to redirect_to root_path
      end
    end

    context "when the admin is signed in" do
      before { sign_in admin }

      it "returns a success response" do
        get new_faction_path
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        post factions_path, params: { faction: { name: "Test Faction" } }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "redirects to root path" do
        post factions_path, params: { faction: { name: "Test Faction" } }
        expect(response).to redirect_to root_path
      end
    end

    context "when the admin is signed in" do
      before { sign_in admin }

      it "creates a new faction" do
        post factions_path, params: { faction: { name: "Test Faction" } }
        expect(response).to redirect_to faction_path(Faction.last)
      end
    end
  end

  describe "GET /edit" do
    let(:faction) { create(:faction) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        get edit_faction_path(faction)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "redirects to root path" do
        get edit_faction_path(faction)
        expect(response).to redirect_to root_path
      end
    end

    context "when the admin is signed in" do
      before { sign_in admin }

      it "returns a success response" do
        get edit_faction_path(faction)
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    let(:faction) { create(:faction) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        patch faction_path(faction), params: { faction: { name: "Test Faction" } }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "redirects to root path" do
        patch faction_path(faction), params: { faction: { name: "Test Faction" } }
        expect(response).to redirect_to root_path
      end
    end

    context "when the admin is signed in" do
      before { sign_in admin }

      it "updates the faction" do
        patch faction_path(faction), params: { faction: { name: "Test Faction" } }
        expect(response).to redirect_to faction_path(faction)
      end
    end
  end

  describe "DELETE /destroy" do
    let(:faction) { create(:faction) }

    context "when the user is not signed in" do
      it "redirects to the sign in page" do
        delete faction_path(faction)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when the user is signed in" do
      before { sign_in user }

      it "redirects to root path" do
        delete faction_path(faction)
        expect(response).to redirect_to root_path
      end
    end

    context "when the admin is signed in" do
      before { sign_in admin }

      it "deletes the faction" do
        delete faction_path(faction)
        expect(response).to redirect_to factions_path
      end
    end
  end
end
