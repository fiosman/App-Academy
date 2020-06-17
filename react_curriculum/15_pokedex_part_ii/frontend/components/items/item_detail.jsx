import React from "react";

const ItemDetail = (props) => {
  const item = props.item; 
  return (
    <section>
      <h2>{item.name}</h2>
      <ul>
        <li>Happiness: {item.happiness}</li>
        <li>Price: {item.price}</li>
      </ul>
    </section>
  );
};

export default ItemDetail;
