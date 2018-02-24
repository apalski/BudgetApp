require "rails_helper"

describe Admin::UsersController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new user" do
        user = create(:user, admin: true)
        allow(controller).to receive(:current_user).and_return(user)

        admin_user_params = { email: "john@example.com" }

        expect do
          post :create, params: { user: admin_user_params }
        end.not_to change(User, :count)
      end

      it "renders new" do
        user = create(:user, admin: true)
        allow(controller).to receive(:current_user).and_return(user)
        admin_user_params = { email: "john@example.com" }

        post :create, params: { user: admin_user_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        user = create(:user, admin: true)
        allow(controller).to receive(:current_user).and_return(user)
        admin_user_params = { email: "john@example.com" }

        post :create, params: { user: admin_user_params }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.create.alert", resource_name: "User")
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update a user's profile" do
        admin = create(:user, admin: true)
        allow(controller).to receive(:current_user).and_return(admin)
        user = create(:user, name: "John")

        put :update, params: { id: user.id, user: { name: "" } }

        expect(user.reload.name).to eq "John"
      end

      it "renders edit" do
        admin = create(:user, admin: true)
        allow(controller).to receive(:current_user).and_return(admin)
        user = create(:user)

        put :update, params: { id: user.id, user: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
        admin = create(:user, admin: true)
        allow(controller).to receive(:current_user).and_return(admin)
        user = create(:user)

        put :update, params: { id: user.id, user: { name: "" } }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.update.alert", resource_name: "User")
      end
    end
  end

  context "DELETE #destroy" do
    context "when user does not exist" do
      it "will raise record missing error" do
        admin = create(:user, admin: true)
        allow(controller).to receive(:current_user).and_return(admin)

        expect do
          delete :destroy, params: { id: 10 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
