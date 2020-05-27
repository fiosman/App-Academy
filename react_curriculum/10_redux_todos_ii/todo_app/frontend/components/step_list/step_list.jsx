import React from "react";
import StepListItemContainer from "./step_list_item_container";
import StepForm from "./step_form";

const StepList = (props) => {
  const items = (
    <ul>
      {props.steps.map((step) => (
        <StepListItemContainer step={step} key={step.id} />
      ))}
    </ul>
  );

  return (
    <div className="step-list">
      {items}
      <StepForm todoId={props.todoId} receiveStep={props.receiveStep} />
    </div>
  );
};

export default StepList;
