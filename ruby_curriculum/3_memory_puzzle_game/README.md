# Challenges 

Came across an interesting "bug" that took me a bit of time to hash out. When a player correctly guesses two matching pairs, that are in adjacent positions within the deck array, only one of the pairs would be removed from the deck, while the other remains unchanged. This problem did not seem to be the case when the guessed matching pairs weren't in adjacent positions. 

For now, I have implemented a bruteforce solution that fixes the problem. However, I am still unsure of the root of the problem. Nonetheless, I will be sure to do more research to figure out why the old algorithm wasn't working. 

Old Algorithm 
```ruby
  def delete_pairs
    @deck.each do |card| 
      if card.face_up
         @deck.delete(card) 
      end
    end
  end
```

New Algorithm 

```ruby
  def remove_pairs
    @deck.reject! { |card| card.face_up }
  end
```

