json.partial! '/api/benches/bench', bench: @bench

json.set! :reviews do 
  @bench.reviews.each do |review| 
    json.set! review.id do 
      json.partial! 'api/reviews/review', review: review
    end
  end
end

json.average_rating @bench.average_rating