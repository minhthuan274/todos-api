json.tasks @tasks do |task|
    json.extract! task, :id, :title, :complete
end
json.user_id @user_id