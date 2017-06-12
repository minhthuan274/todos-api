  class ListsController < ApplicationController
  before_action :get_list, only: [:show, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @lists = @user.lists
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def show
    @tasks = @list.tasks
  end

  def update
    @list.update(list_params)
    head :ok
  end

  def destroy 
    @list.destroy
    head :ok
  end

  private 
  def list_params
    params.permit(:title, :user_id)
  end

  def get_list
    @list = List.find(params[:id])
  end
end
