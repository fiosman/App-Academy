import React from "react";

const PokemonIndexItem = (props) => {
  return (
    <li>
      <span>{props.poke.name}</span>
      <img src={props.poke.image_url} />
    </li>
  );
};

export default PokemonIndexItem;
