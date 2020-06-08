json.name @party.name

json.guests @party.guests do |guest|
  json.name guest.name
  json.gifts guest.gifts, :title, :description
end
