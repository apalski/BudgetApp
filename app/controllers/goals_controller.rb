class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)

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
      permit(:name, :due_date, :amount)
  end

  def goal
    @goal ||= Goal.find(params[:id])
  end
  helper_method :goal
end
