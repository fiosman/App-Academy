import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions'; 
import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions'; 

const pokemonReducer = (state={}, action) => { 
  switch(action.type) { 
    case RECEIVE_ALL_POKEMON: 
      return Object.assign({}, state, action.pokemon);
    case RECEIVE_SINGLE_POKEMON: 
      let newState = Object.assign({}, state); 
      newState[action.onePokemon.pokemon.id] = action.onePokemon.pokemon; 
      return newState; 
    default: 
      return state; 
  }
}

export default pokemonReducer;