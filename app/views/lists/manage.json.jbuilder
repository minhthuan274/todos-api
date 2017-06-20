json.lists @lists do |list|
  todo_count = done_count = 0
  list.tasks.each do |task| 
    if task.complete 
      done_count += 1
    else
      todo_count += 1
    end
  end
  json.extract! list, :id, :title
  json.shares list.shares_label 
  json.todo_count todo_count
  json.done_count done_count
  json.user_email User.find_by_id(list.user_id).email
end
