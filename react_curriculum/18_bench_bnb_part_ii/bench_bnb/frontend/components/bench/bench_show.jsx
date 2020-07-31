import React from "react";
import BenchMap from "../bench_map/bench_map";
import BenchDetail from "./bench_detail";
import { Link } from "react-router-dom";
import { ProtectedRoute } from "../../util/route_util";
import ReviewFormContainer from "./review_form_container";

const BenchShow = (props) => {
  const reviewStatus =
    props.location.pathname === `/benches/${props.benchId}` ? (
      <Link to={`/benches/${props.benchId}/review`}> Leave a Review</Link>
    ) : (
      ""
    );
  const benches = {
    [props.benchId]: props.bench,
  };

  return (
    <div>
      <Link to="/">Return to main page</Link>
      <BenchMap
        benches={benches}
        benchId={props.benchId}
        singleBench={true}
        fetchBench={props.fetchBench}
      />
      <h2>Bench Details</h2>
      <BenchDetail bench={props.bench} reviews={props.reviews} />
      <img src={benches[props.benchId].photoUrl} />
      {reviewStatus}
      <ProtectedRoute
        path="/benches/:benchId/review"
        component={ReviewFormContainer}
      />
    </div>
  );
};
export default BenchShow;
