json.extract! poll, :id, :Title, :Description, :Start_Date, :End_Date, :created_at, :updated_at
json.url poll_url(poll, format: :json)
