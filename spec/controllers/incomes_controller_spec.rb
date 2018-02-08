require "rails_helper"

describe IncomesController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new income" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", amount: 500 }

        expect do
          post :create, params: { income: income_params }
        end.to change(Income, :count).by(0)
      end

      it "renders new" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", amount: 500 }

        post :create, params: { income: income_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", amount: 500 }

        post :create, params: { income: income_params }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.create.alert", resource_name: "Income")
      end
    end

    context "when there isn't a budget" do
      it "won't create a new income" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", frequency: "Monthly" }

        expect do
          post :create, params: { income: income_params }
        end.to change(Income, :count).by(0)
      end

      it "renders #new" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", frequency: "Monthly" }

        post :create, params: { income: income_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash alert" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        income_params = { name: "Salary", frequency: "Monthly" }

        post :create, params: { income: income_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Income")
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update the income attributes" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        income = create(:income, name: "salary")

        put :update, params: { id: income.id, income: { name: "" } }

        expect(income.name).to eq "salary"
      end

      it "renders edit" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        income = create(:income)

        put :update, params: { id: income.id, income: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        income = create(:income)

        put :update, params: { id: income.id, income: { name: "" } }

        expect(flash[:alert]).
          to match I18n.t("flash.actions.update.alert", resource_name: "Income")
      end
    end
  end

  context "DELETE #destroy" do
    context "income doesn't exist" do
      it "won't change Income count" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        income = create(:income)

        delete :destroy, params: { id: income.id }

        expect do
          delete :destroy, params: { id: income.id }
        end.to change(Income, :count).by(0)
      end
    end
  end
end
