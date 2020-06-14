json.pokemon do 
  json.extract! @pokemon, 
    :id,
    :name, 
    :attack, 
    :defense, 
    :moves, 
    :poke_type 
  json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
  json.item_ids do 
    json.array! @pokemon.item_ids
  end
end

json.items do 
  @pokemon.items.each do |item| 
    json.set! item.id do 
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness
      json.image_url asset_path("#{item.image_url}")
    end
  end
end
