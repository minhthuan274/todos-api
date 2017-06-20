class SearchsController < ApplicationController
  def index
    unless params[:user_id].blank?
      tasks_id = []
      user = User.find_by_id(params[:user_id])
      user.lists.each { |list| 
        list.tasks.each do |task|
          tasks_id << task.id
        end
      }
      @tasks = Task.all.where(["title LIKE ?", "%#{params[:query]}%"]).to_a
      @tasks.select! do |task|
         tasks_id.include?(task.id) 
      end
    end
  end

end
