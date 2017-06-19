json.users @users_not_shared do |user| 
  json.extract! user, :id, :email
end
