import * as APIUtil from '../util/api_util'; 

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON'; 
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON'; 

//synchronous action creators
export const receiveAllPokemon = (pokemon) => ({ 
  type: RECEIVE_ALL_POKEMON, 
  pokemon
})

export const receiveSinglePokemon = (onePokemon) => ({ 
  type: RECEIVE_SINGLE_POKEMON, 
  onePokemon
})

//asynchronous action creators
export const requestAllPokemon = () => (dispatch) => ( 
  APIUtil.fetchAllPokemon().then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)