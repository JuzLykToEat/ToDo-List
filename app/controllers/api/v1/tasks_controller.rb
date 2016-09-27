class API::V1::TasksController < API::V1::BaseController
  def index
    @tasks = Task.where(user_id: current_api_user&.id)
    # binding.pry
    render(json: @tasks, status: 200)
  end

  def create
    @task = current_api_user.tasks.build(task_params)

    if @task.save
      render(json: @task, status: 200)
    end
  end

  def edit
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    if @task.destroy
      render(json: @task, status: 200)
    end
  end

  def done
    @task = Task.find_by(id: params[:task_id])

    if @task.complete == false
      @task.update(complete: true)
      render(json: @task, status: 200)
    else
      @task.update(complete: false)
      render(json: @task, status: 200)
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :complete)
    end
end
