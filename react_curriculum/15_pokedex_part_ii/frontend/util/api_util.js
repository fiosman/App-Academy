export const fetchAllPokemon = () => { 
  return $.ajax({ 
    method: 'GET', 
    url: '/api/pokemon'
  })
}

export const fetchPokemon = (pokemonId) => { 
  return $.ajax({ 
    method: 'GET', 
    url: `/api/pokemon/${pokemonId}`
  })
}