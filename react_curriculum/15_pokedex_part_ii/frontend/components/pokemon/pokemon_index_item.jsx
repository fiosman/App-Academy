import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {
  return (
    <Link to={`/pokemon/${props.poke.id}`}>
      <li className="poke">
        <span>{props.poke.id}</span>
        <img src={props.poke.image_url} />
        <span>{props.poke.name}</span>
      </li>
    </Link>
  );
};

export default PokemonIndexItem;
