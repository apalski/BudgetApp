require "rails_helper"

describe BudgetsController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new budget" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        budget_params = { budget_type: "Holiday" }

        expect do
          post :create, params: { budget: budget_params }
        end.to change(Budget, :count).by(0)
      end

      it "renders new" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        budget_params = { budget_type: "Holiday" }

        post :create, params: { budget: budget_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        budget_params = { budget_type: "Holiday" }

        post :create, params: { budget: budget_params }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.create.alert", resource_name: "Budget")
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update the budget attributes" do
        user = create(:user)
        budget = create(:budget, name: "Holiday", user: user)
        allow(controller).to receive(:current_user).and_return(user)

        put :update, params: { id: budget.id, budget: { name: "" } }

        expect(budget.name).to eq "Holiday"
      end

      it "renders edit" do
        user = create(:user)
        budget = create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)

        put :update, params: { id: budget.id, budget: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
        user = create(:user)
        budget = create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)

        put :update, params: { id: budget.id, budget: { name: "" } }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.update.alert", resource_name: "Budget")
      end
    end
  end

  context "DELETE #destroy" do
    context "user is not logged in" do
      it "does not delete a budget" do
        budget = create(:budget)

        delete :destroy, params: { id: budget.id }

        expect do
          delete :destroy, params: { id: budget.id }
        end.to change(Budget, :count).by(0)
      end
    end
  end
end
