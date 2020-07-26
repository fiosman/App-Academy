import React from "react";

const ReviewIndex = (props) => {
  const reviewIds= Object.keys(props.reviews);
  if (props.reviews) {
    return reviewIds.map((reviewId => {
      return (
        <ul key={reviewId}>
          <li>{props.reviews[reviewId].rating}</li>
          <li>{props.reviews[reviewId].body}</li>
        </ul>
      );
    }));
  } else {
    return <h2>No reviews</h2>;
  }
};

export default ReviewIndex;
