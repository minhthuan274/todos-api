json.lists @lists do |list|
  json.extract! list, :id, :title, :user_id
end

json.shares @shares do |share| 
  list = List.find_by_id(share.list_id)
  json.id list.id
  json.title list.name_with_shared_user
  json.user_id list.user_id
end
