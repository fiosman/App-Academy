json.array!(@feed_tweets) do |tweet| 
  json.partial!("tweets/tweet", tweet: tweet)
end