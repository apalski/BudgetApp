require "rails_helper"

describe ExpensesController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new expense" do
        expense_params = { name: "Gas", bill_estimate: 500 }

        expect do
          post :create, params: { expense: expense_params }
        end.to change(Expense, :count).by(0)
      end

      it "renders new" do
        expense_params = { name: "Gas", bill_estimate: 500 }

        post :create, params: { expense: expense_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        expense_params = { name: "Gas", bill_estimate: 500 }

        post :create, params: { expense: expense_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Expense")
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update the expense attributes" do
        expense = create(:expense, name: "gas")

        put :update, params: { id: expense.id, expense: { name: "" } }

        expect(expense.name).to eq "gas"
      end

      it "renders edit" do
        expense = create(:expense)

        put :update, params: { id: expense.id, expense: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
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
        expense = create(:expense)
        delete :destroy, params: { id: expense.id }

        expect do
          delete :destroy, params: { id: expense.id }
        end.to change(Expense, :count).by(0)
      end
    end
  end
end
