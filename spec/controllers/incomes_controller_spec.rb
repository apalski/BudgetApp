require "rails_helper"

describe IncomesController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new income" do
        create_current_user_with_budget
        income_params = { name: "Salary", amount: 500, frequency: "" }

        expect do
          post :create, params: { income: income_params }
        end.to change(Income, :count).by(0)
      end

      it "renders new" do
        create_current_user_with_budget
        income_params = { name: "Salary", amount: 500, frequency: "" }

        post :create, params: { income: income_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        create_current_user_with_budget
        income_params = { name: "Salary", amount: 500, frequency: "" }

        post :create, params: { income: income_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Income")
      end
    end

    context "when there isn't a budget" do
      it "won't create a new income" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", frequency: "monthly" }

        expect do
          post :create, params: { income: income_params }
        end.to change(Income, :count).by(0)
      end

      it "renders #new" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", frequency: "monthly" }

        post :create, params: { income: income_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash alert" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", frequency: "monthly" }

        post :create, params: { income: income_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Income")
      end
    end
  end

  context "GET #show" do
    context "when not the income owner" do
      it "redirects the user to their budget view" do
        create_current_user_with_budget
        create(:income, name: "gas", budget: @budget)
        other_income = create(:income)

        get :show, params: { id: other_income.id }

        expect(response.body).to redirect_to(budgets_path)
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update the income" do
        create_current_user_with_budget
        income = create(:income, name: "salary")

        put :update, params: { id: income.id, income: { name: "" } }

        expect(income.reload.name).to eq "salary"
      end

      it "renders edit" do
        create_current_user_with_budget
        income = create(:income)

        put :update, params: { id: income.id, income: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
        create_current_user_with_budget
        income = create(:income)

        put :update, params: { id: income.id, income: { name: "" } }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.update.alert", resource_name: "Income")
      end
    end
  end

  context "DELETE #destroy" do
    context "income doesn't exist" do
      it "won't change income count" do
        create_current_user_with_budget
        income = create(:income)

        delete :destroy, params: { id: income.id }

        expect do
          delete :destroy, params: { id: income.id }
        end.to change(Income, :count).by(0)
      end
    end
  end

  def create_current_user_with_budget
    user = create(:user)
    @budget = create(:budget, user: user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
