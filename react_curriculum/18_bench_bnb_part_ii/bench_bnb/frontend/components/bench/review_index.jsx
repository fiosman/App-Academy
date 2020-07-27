import React from "react";

const ReviewIndex = (props) => {
  const reviewIds = Object.keys(props.reviews);
  if (props.reviews) {
    return reviewIds.map((reviewId) => {
      return (
        <ul key={reviewId}>
          <li>Rating: {props.reviews[reviewId].rating}</li>
          <li>How was it? {props.reviews[reviewId].body}</li>
          <li>Posted by: {props.reviews[reviewId].author}</li>
        </ul>
      );
    });
  } else {
    return <h2>No reviews</h2>;
  }
};

export default ReviewIndex;
