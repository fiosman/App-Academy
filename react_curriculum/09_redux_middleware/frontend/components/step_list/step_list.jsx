import React from 'react';
// Components
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

const StepList = ({ steps, todo_id, receiveStep }) => {
  const stepItems = steps.map(step => (
    <StepListItemContainer
      key={step.id}
      step={step} />
  ));

  return (
    <div>
      <ul className="step-list">
        { stepItems }
      </ul>
      <StepForm todo_id={ todo_id } receiveStep={ receiveStep } />
    </div>
  )
};

export default StepList;
