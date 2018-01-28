require "rails_helper"

describe UsersController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new user" do
        user_params = { email: "john@example.com" }

        expect do
          post :create, params: { user: user_params }
        end.not_to change(User, :count)
      end

      it "renders new" do
        user_params = { email: "john@example.com" }

        post :create, params: { user: user_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        user_params = { email: "john@example.com" }

        post :create, params: { user: user_params }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.create.alert", resource_name: "User")
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update a user's profile" do
        user = create(:user, name: "John")

        put :update, params: { id: user.id, user: { name: "" } }

        expect(user.name).to eq "John"
      end

      it "renders edit" do
        user = create(:user)

        put :update, params: { id: user.id, user: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
        user = create(:user)

        put :update, params: { id: user.id, user: { name: "" } }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.update.alert", resource_name: "User")
      end
    end
  end
end
