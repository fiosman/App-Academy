json.array!(@users) do |user| 
  json.(user, *User.column_names)
  json.followed(current_user.follows?(user))
end