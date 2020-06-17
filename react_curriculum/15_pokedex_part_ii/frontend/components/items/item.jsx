import React from "react";
import { Link } from "react-router-dom";

const Item = (props) => {
  return (
    <li>
      <Link to={`/pokemon/${props.item.pokemon_id}/item/${props.item.id}`}>
        <img src={props.item.image_url} />
      </Link>
    </li>
  );
};

export default Item;
