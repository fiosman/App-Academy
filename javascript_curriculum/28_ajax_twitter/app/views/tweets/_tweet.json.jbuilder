json.(tweet, *Tweet.column_names)

json.user(tweet.user, *User.column_names)

json.mentions(tweet.mentions) do |mention|
  json.(mention, *Mention.column_names)
  json.user(mention.user, *User.column_names)
end