import React from 'react'; 

const GiphysIndexItem = (props) => { 
  return ( 
    <li>
      <img src={props.giphy.images.fixed_height.url}></img>
    </li>
  )
}

export default GiphysIndexItem;
