require "rails_helper"

describe SessionsController do
  context "GET #new" do
    context "without a password" do
      it "does not set current user" do
        user = create(:user)
        session_params = { email: user.email }

        post :create, params: { session: session_params }

        expect(controller.current_user).to be nil
      end

      it "renders new" do
        user = create(:user)
        session_params = { email: user.email }

        post :create, params: { session: session_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        user = create(:user)
        session_params = { email: user.email }

        post :create, params: { session: session_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Session")
      end
    end

    context "with a password" do
      it "sets current user" do
        user = create(:user)
        session_params = { email: user.email, password: user.password }

        post :create, params: { session: session_params }

        expect(controller.current_user.id).to eq user.id
      end
    end
  end

  context "User already signed in" do
    it "renders user#show" do
      user = create(:user)
      session_params = { email: user.email, password: user.password }

      post :create, params: { session: session_params }
      get :new

      expect(response).to redirect_to(user_path(user))
    end

    it "sets the flash[:alert]" do
      user = create(:user)
      session_params = { email: user.email, password: user.password }

      post :create, params: { session: session_params }
      get :new

      expect(flash[:alert]).
        to match I18n.
        t("flash.actions.create.alert", resource_name: "Session")
    end
  end
end
