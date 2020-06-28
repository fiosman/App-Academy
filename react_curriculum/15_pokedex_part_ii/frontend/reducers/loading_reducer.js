import { START_LOADING_ALL_POKEMON } from '../actions/pokemon_actions'; 
import { START_LOADING_SINGLE_POKEMON} from '../actions/pokemon_actions'; 
import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions'; 
import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions'; 

const initialState = { 
  index: false, 
  detail: false, 
}

const loadingReducer = (state = initialState, action) => { 
  switch(action.type) { 
    case START_LOADING_ALL_POKEMON: 
      return Object.assign({}, state, { index: true })
    case START_LOADING_SINGLE_POKEMON: 
      return Object.assign({}, state, { detail: true })
    case RECEIVE_ALL_POKEMON: 
      return Object.assign({}, state, { index: false})
    case RECEIVE_SINGLE_POKEMON: 
      return Object.assign({}, state, { detail: false}) 
    default: 
      return state;
  }
}

export default loadingReducer; 