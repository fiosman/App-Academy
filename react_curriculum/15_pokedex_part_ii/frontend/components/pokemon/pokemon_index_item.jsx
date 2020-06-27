import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {
  return (
    <li className="poke">
      <Link to={`/pokemon/${props.poke.id}`}>
        <span>{props.poke.id}</span>
        <img src={props.poke.image_url} />
        <span>{props.poke.name}</span>
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
