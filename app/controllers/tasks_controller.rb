class TasksController < ApplicationController
  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to root_path
    end
  end

  def edit
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    if @task.destroy
      redirect_to root_path
    end
  end

  def done
    @task = Task.find_by(id: params[:id])
    @task.update(complete: true)

    if @task.complete == true
      redirect_to root_path
    end
  end

  def undone
    @task = Task.find_by(id: params[:id])
    @task.update(complete: false)

    if @task.complete == false
      redirect_to root_path
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :complete)
    end
end
