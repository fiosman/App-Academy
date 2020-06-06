import React from "react";
// Components
import StepListItemContainer from "./step_list_item_container";
import StepForm from "./step_form";

const StepList = (props) => {
  console.log(props.todo_id)
  const stepItems = props.steps.map((step) => (
    <StepListItemContainer key={step.id} step={step} />
  ));

  return (
    <div>
      <ul className="step-list">{stepItems}</ul>
      <StepForm todo_id={props.todo_id} createStep={props.createStep} />
    </div>
  );
};

export default StepList;
