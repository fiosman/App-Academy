export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP"; 
import * as APIUtil from '../util/steps_api_util.js'; 

export const receiveSteps = (steps) => ({ 
  type: RECEIVE_STEPS, 
  steps, 
})

export const receiveStep = (step) => ({ 
  type: RECEIVE_STEP, 
  step,
})

export const removeStep = (step) => ({ 
  type: REMOVE_STEP, 
  step, 
})

export const fetchSteps = (todoId) => (dispatch) => { 
  return APIUtil.fetchSteps(todoId).then((steps) => dispatch(receiveSteps(steps)));
}
