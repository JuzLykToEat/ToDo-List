class LandingController < ApplicationController

  def index
    @tasks = Task.where(user_id: current_user.id)
    @task = Task.new
  end
end
