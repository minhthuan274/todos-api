class TasksController < ApplicationController
  before_action :get_task, only: [:update, :destroy]

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(title: params[:title], complete: false)
    if @task.save 
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors
    end
  end

  def mark_all_done
    if params[:list_id] 
      @list = List.find(params[:list_id])
      @tasks = @list.tasks
      @tasks.each { |task| task.set_done }
    end
    head :ok
  end

  def update
    @task.set_done
    head :ok
  end

  def destroy 
    @task.destroy 
    head :ok
  end

  private 
    def get_task
      @task = Task.find(params[:id])
    end
end