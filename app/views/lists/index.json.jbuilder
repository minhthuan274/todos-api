json.lists @lists do |list|
  json.extract! list, :id, :title, :user_id
end