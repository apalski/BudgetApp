require "rails_helper"

describe SessionsController do
  context "GET #new" do
    it "won't log the user in" do
      session_params = { email: "john@example.com" }

      expect do
        post :create, params: { session: session_params }
      end
    end

    it "renders new" do
      session_params = { email: "john@example.com" }

      post :create, params: { session: session_params }

      expect(response).to render_template(:new)
    end

    it "sets the flash[:alert]" do
      session_params = { email: "john@example.com" }

      post :create, params: { session: session_params }

      expect(flash[:alert]).to match I18n.t("flash.actions.create.alert", resource_name: "Session")
    end
  end
end
