export const selectAllPokemon = (state) => {
  const pokemon = state.entities.pokemon;
  return Object.values(pokemon);
};

export const selectPokemonItems = (state, pokemon) => {
 return pokemon? pokemon.item_ids.map((itemId) => state.entities.items[itemId]) : [];
};

export const selectPokemonItem = (state, itemId) => { 
  return state.entities.items[itemId]; 
}