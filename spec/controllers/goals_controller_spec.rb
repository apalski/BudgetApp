require "rails_helper"

describe GoalsController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new goal" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        goal_params = { name: "Holiday" }

        expect do
          post :create, params: { goal: goal_params }
        end.to change(Goal, :count).by(0)
      end

      it "renders new" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        goal_params = { name: "Holiday", amount: 500 }

        post :create, params: { goal: goal_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        goal_params = { name: "Holiday", amount: 500 }

        post :create, params: { goal: goal_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Goal")
      end
    end

    context "when there isn't a budget" do
      it "won't create a new goal" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        goal_params = {
          name: "Holiday",
          due_date: "27/04/2018",
          amount: 1000.00,
        }

        expect do
          post :create, params: { goal: goal_params }
        end.to change(Goal, :count).by(0)
      end

      it "renders #new" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        goal_params = {
          name: "Holiday",
          due_date: "27/04/2018",
          amount: 1000.00,
        }

        post :create, params: { goal: goal_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash alert" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        goal_params = {
          name: "Holiday",
          due_date: "27/04/2018",
          amount: 1000.00,
        }

        post :create, params: { goal: goal_params }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.create.alert", resource_name: "Goal")
      end
    end
  end

  context "GET #edit" do
    context "when invalid parameters" do
      it "won't update the goal attributes" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        goal = create(:goal, name: "Holiday")

        put :update, params: { id: goal.id, goal: { name: "" } }

        expect(goal.name).to eq "Holiday"
      end

      it "renders edit" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        goal = create(:goal)

        put :update, params: { id: goal.id, goal: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        goal = create(:goal)

        put :update, params: { id: goal.id, goal: { name: "" } }

        expect(flash[:alert]).
          to match I18n.
          t("flash.actions.update.alert", resource_name: "Goal")
      end
    end
  end

  context "DELETE #destroy" do
    context "goal doesn't exist" do
      it "won't change Goal count" do
        user = create(:user)
        create(:budget, user: user)
        allow(controller).to receive(:current_user).and_return(user)
        goal = create(:goal)

        delete :destroy, params: { id: goal.id }

        expect do
          delete :destroy, params: { id: goal.id }
        end.to change(Goal, :count).by(0)
      end
    end
  end
end
