import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {
  return (
    <li>
      <Link to={`/pokemon/${props.poke.id}`}>
        <span>{props.poke.name}</span>
        <img src={props.poke.image_url} />
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
