class GoalsController < ApplicationController
  before_action :require_login

  def index
    @goals = current_user.budget.goals.by_name
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params.merge(budget: current_user.budget))

    respond_with(@goal)
  end

  def show
  end

  def edit
  end

  def update
    goal.update_attributes(goal_params)

    respond_with(goal)
  end

  def destroy
    goal.delete

    respond_with goal, location: -> { new_goal_path }
  end

  private

  def goal_params
    params.require(:goal).
      permit(:name, :due_date, :amount, :budget_id)
  end

  def goal
    @goal ||= Goal.find(params[:id])
  end
  helper_method :goal
end
