json.array! @parties do |party| 
  json.guests party.guests 
  json.location party.location 
  json.name party.name
end