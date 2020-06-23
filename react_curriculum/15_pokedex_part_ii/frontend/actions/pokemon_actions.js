import * as APIUtil from "../util/api_util";

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_POKEMON_ERRORS = "RECEIVE_POKEMON_ERRORS";

//synchronous action creators
export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon,
});

export const receiveSinglePokemon = (onePokemon) => ({
  type: RECEIVE_SINGLE_POKEMON,
  onePokemon,
});

export const receivePokemonErrors = (errors) => ({ 
  type: RECEIVE_POKEMON_ERRORS, 
  errors
})

//thunk action creators
export const requestAllPokemon = () => (dispatch) =>
  APIUtil.fetchAllPokemon().then((pokemon) =>
    dispatch(receiveAllPokemon(pokemon))
  );

export const requestSinglePokemon = (pokemonId) => (dispatch) =>
  APIUtil.fetchPokemon(pokemonId).then((pokemon) =>
    dispatch(receiveSinglePokemon(pokemon))
  );

export const createNewPokemon = (pokeData) => (dispatch) =>
  APIUtil.createPokemon(pokeData)
    .then((poke) => {
      dispatch(receiveSinglePokemon(poke));
      return poke;
    })

