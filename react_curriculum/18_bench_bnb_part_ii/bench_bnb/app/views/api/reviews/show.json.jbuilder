json.partial! '/api/reviews/review', review: @review

json.average_rating @review.bench.average_rating

json.author @review.author.username
