import {
  RECEIVE_STEPS,
  RECEIVE_STEP,
  REMOVE_STEP,
} from "../actions/step_actions";

const initialState = {
  1: {
    id: 1,
    title: "go to store",
    body: "",
    done: false,
    todoId: 1,
  },
  2: {
    id: 2,
    title: "buy soap",
    body: "",
    done: false,
    todoId: 1,
  },
};

const stepsReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_STEPS:
      let newSteps = Object.assign({}, state);
      action.steps.forEach((step) => {
        newSteps[step.id] = step;
      });
      return newSteps;

    case RECEIVE_STEP:
      let newStepState = Object.assign({}, state);
      newStepState[action.step.id] = action.step;
      return newStepState;

    case REMOVE_STEP:
      let receivedState = Object.assign({}, state);
      delete receivedState[action.step.id];

      return receivedState;

    default:
      return state;
  }
};

export default stepsReducer;
