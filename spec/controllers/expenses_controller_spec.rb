require "rails_helper"

describe ExpensesController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new expense" do
        create_current_user
        expense_params = { name: "Gas", bill_estimate: 500, frequency: "" }

        expect do
          post :create, params: { expense: expense_params }
        end.to change(Expense, :count).by(0)
      end

      it "renders #new" do
        create_current_user
        expense_params = { name: "Gas", bill_estimate: 500, frequency: "" }

        post :create, params: { expense: expense_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        create_current_user
        expense_params = { name: "Gas", bill_estimate: 500, frequency: "" }

        post :create, params: { expense: expense_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Expense")
      end
    end
  end

  context "GET #show" do
    context "when not the expense owner" do
      it "redirects the user to their budget view" do
        create_current_user
        other_user = create(:user)
        expense = create(:expense, user: other_user)

        expect do
          get :show, params: { id: expense.id }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update the expense" do
        create_current_user
        expense = create(:expense)

        expect do
          put :update, params: { id: expense.id, expense: { name: "" } }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context "DELETE #destroy" do
    context "expense doesn't exist" do
      it "won't change Expense count" do
        create_current_user

        expect do
          delete :destroy, params: { id: 200 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  def create_current_user
    user = create(:user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
