import React from 'react'; 

const ReviewIndex = (props) => { 
  const reviews = props.bench.reviews;
  if(reviews) { 
  return ( props.bench.reviews.map((review => { 
      <ul>
        <li>{review.rating}</li>
        <li>{review.body}</li>
      </ul>
    }))
  );
  } else { 
    return <h2>No reviews</h2>
  }
}

export default ReviewIndex;