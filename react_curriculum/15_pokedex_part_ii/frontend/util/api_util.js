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

export const createPokemon = (pokemon) => { 
  return $.ajax({ 
    method: 'POST', 
    url: `/api/pokemon`,
    // dataType: 'json',
    // contentType: 'application/json',
    // data: JSON.stringify(pokemon)
    data: { pokemon }
  })
}