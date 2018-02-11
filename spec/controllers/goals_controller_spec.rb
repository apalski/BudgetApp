require "rails_helper"

describe GoalsController do
  context "GET #new" do
    context "when invalid params" do
      it "won't create a new goal" do
        goal_params = { name: "Holiday" }

        expect do
          post :create, params: { goal: goal_params }
        end.to change(Goal, :count).by(0)
      end

      it "renders new" do
        goal_params = { name: "Holiday", amount: 500 }

        post :create, params: { goal: goal_params }

        expect(response).to render_template(:new)
      end

      it "sets the flash[:alert]" do
        goal_params = { name: "Holiday", amount: 500 }

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
        goal = create(:goal, name: "Holiday")

        put :update, params: { id: goal.id, goal: { name: "" } }

        expect(goal.name).to eq "Holiday"
      end

      it "renders edit" do
        goal = create(:goal)

        put :update, params: { id: goal.id, goal: { name: "" } }

        expect(response).to render_template(:edit)
      end

      it "sets the flash[:alert]" do
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
        goal = create(:goal)

        delete :destroy, params: { id: goal.id }

        expect do
          delete :destroy, params: { id: goal.id }
        end.to change(Goal, :count).by(0)
      end
    end
  end
end
