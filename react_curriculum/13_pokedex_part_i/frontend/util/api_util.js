export const fetchAllPokemon = () => { 
  return $.ajax({ 
    method: 'GET', 
    url: '/api/pokemon'
  })
}