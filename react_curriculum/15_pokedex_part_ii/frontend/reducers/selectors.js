export const selectAllPokemon = (state) => { 
  const pokemon = state.entities.pokemon; 
  return Object.values(pokemon)
}