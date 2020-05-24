import { RECEIVE_TODOS,
         RECEIVE_TODO,
         REMOVE_TODO,
         TODO_ERROR } from '../actions/todo_actions';

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};

  switch(action.type){
    case RECEIVE_TODOS:
      action.todos.forEach( todo => {
        nextState[todo.id] = todo;
      });
      return nextState;
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      return Object.assign({}, state, newTodo);
    case REMOVE_TODO:
      nextState = Object.assign({}, state);
      delete nextState[action.todo.id];
      return nextState;
    case TODO_ERROR:
      alert(action.error);
    default:
      return state;
  }
};

export default todosReducer;

// Sample State Shape
// {
//   "1": {
//     id: 1,
//     title: "wash car",
//     body: "with soap",
//     done: false
//   },
//   "2": {
//     id: 2,
//     title: "wash dog",
//     body: "with shampoo",
//     done: true
//   },
// };
