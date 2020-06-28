import * as APIUtil from "../util/api_util";
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_POKEMON_ERRORS = "RECEIVE_POKEMON_ERRORS";
export const START_LOADING_ALL_POKEMON = "START_LOADING_ALL_POKEMON";
export const START_LOADING_SINGLE_POKEMON = "START_LOADING_SINGLE_POKEMON";

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
  errors,
});

export const startLoadingAllPokemon = () => ({
  type: START_LOADING_ALL_POKEMON,
});

export const startLoadingSinglePokemon = () => ({
  type: START_LOADING_SINGLE_POKEMON,
});

//thunk action creators
export const requestAllPokemon = () => (dispatch) => {
  dispatch(startLoadingAllPokemon());
  APIUtil.fetchAllPokemon().then((pokemon) =>
    dispatch(receiveAllPokemon(pokemon))
  );
};

export const requestSinglePokemon = (pokemonId) => (dispatch) => {
  dispatch(startLoadingSinglePokemon());
  APIUtil.fetchPokemon(pokemonId).then((pokemon) =>
    dispatch(receiveSinglePokemon(pokemon))
  );
};

export const createNewPokemon = (pokeData) => (dispatch) =>
  APIUtil.createPokemon(pokeData)
    .then((poke) => {
      dispatch(receiveSinglePokemon(poke));
      return poke;
    })
    .fail((errors) => dispatch(receivePokemonErrors(errors.responseJSON)));
