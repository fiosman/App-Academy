import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {
  return (
    <Link to={`/pokemon/${props.poke.id}`}>
      <li>
        <span>{props.poke.name}</span>
        <img src={props.poke.image_url} />
      </li>
    </Link>
  );
};

export default PokemonIndexItem;
