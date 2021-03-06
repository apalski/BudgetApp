require "rails_helper"

describe ExpensesController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new expense" do
        create_current_user_with_budget
        expense_params = { name: "Gas", bill_estimate: 500, frequency: "" }

        expect do
          post :create, params: { expense: expense_params }
        end.to change(Expense, :count).by(0)
      end

      it "renders #new" do
        create_current_user_with_budget
        expense_params = { name: "Gas", bill_estimate: 500, frequency: "" }

        post :create, params: { expense: expense_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        create_current_user_with_budget
        expense_params = { name: "Gas", bill_estimate: 500, frequency: "" }

        post :create, params: { expense: expense_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Expense")
      end
    end

    context "when there isn't a budget" do
      it "won't create a new expense" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        expense_params = { name: "Gas", frequency: "monthly" }

        expect do
          post :create, params: { expense: expense_params }
        end.to change(Expense, :count).by(0)
      end

      it "renders #new" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        expense_params = { name: "Gas", frequency: "monthly" }

        post :create, params: { expense: expense_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash alert" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        expense_params = { name: "Gas", frequency: "monthly" }

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
        create_current_user_with_budget
        other_expense = create(:expense)
        create(:expense, name: "gas", budget: @budget)

        get :show, params: { id: other_expense.id }

        expect(response.body).to redirect_to(budgets_path)
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update the expense" do
        create_current_user_with_budget
        expense = create(:expense, name: "gas")

        put :update, params: { id: expense.id, expense: { name: "" } }

        expect(expense.reload.name).to eq "gas"
      end

      it "renders #edit" do
        create_current_user_with_budget
        expense = create(:expense)

        put :update, params: { id: expense.id, expense: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
        create_current_user_with_budget
        expense = create(:expense)

        put :update, params: { id: expense.id, expense: { name: "" } }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.update.alert", resource_name: "Expense")
      end
    end
  end

  context "DELETE #destroy" do
    context "expense doesn't exist" do
      it "won't change Expense count" do
        create_current_user_with_budget
        expense = create(:expense)

        delete :destroy, params: { id: expense.id }

        expect do
          delete :destroy, params: { id: expense.id }
        end.to change(Expense, :count).by(0)
      end
    end
  end

  def create_current_user_with_budget
    user = create(:user)
    @budget = create(:budget, user: user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
