if params[:query].blank? 
  json.found "No query"
else
  json.found @tasks == [] ? "No result" : "Found #{pluralize(@tasks.length, 'result')}"
  json.searchs @tasks do |task| 
    json.extract! task, :id, :title, :complete
    json.list do 
      json.list_id task.list_id
      json.list_title List.find_by_id(task.list_id).title
    end
  end
end