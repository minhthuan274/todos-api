json.lists @lists do |list|
  json.extract! list, :id, :title, :todo_count, :done_count
  json.user_email User.find_by_id(list.user_id).email
end
