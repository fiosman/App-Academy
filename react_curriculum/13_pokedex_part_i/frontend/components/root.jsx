import React from "react";
import { Provider } from "react-redux";
import PokemonIndexContainer from './pokemon/pokemon_index_container.jsx'

const Root = (props) => {
  return (
    <Provider store={props.store}>
      <PokemonIndexContainer/>
    </Provider>
  );
};

export default Root;
