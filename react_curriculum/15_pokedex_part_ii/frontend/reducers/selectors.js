export const selectAllPokemon = (state) => {
  const pokemon = state.entities.pokemon;
  return Object.values(pokemon);
};

export const selectPokemonItems = (state, pokemon) => {
 return pokemon.item_ids.map((itemId) => state.entities.items[itemId]);
};
