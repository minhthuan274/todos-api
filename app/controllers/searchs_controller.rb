class SearchsController < ApplicationController
  def index
      tasks_id = []
      @tasks = []
      user = User.find_by_id(params[:user_id])
      user.lists.each { |list| 
        list.tasks.each do |task|
          tasks_id << task.id
        end
      }
      search = Task.all.where(["title LIKE ?", "%#{params[:query]}%"]).to_a
      search.each do |e|
        @tasks << e if tasks_id.include?(e.id) 
      end
    # end
  end
end
