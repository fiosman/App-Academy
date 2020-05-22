import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions'; 

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false,
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true,
  },
};

const todosReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_TODOS:
      let toDosObj = {}; 
      action.todos.forEach(todo => { 
        toDosObj[todo.id] = todo; 
      });
      return toDosObj;

    case RECEIVE_TODO: 
      let newState = Object.assign({}, state);
      newState[action.todo.id] = action.todo; 
      return newState; 

    case REMOVE_TODO: 
      let receivedState = Object.assign({}, state); 
      delete receivedState[action.todo.id];
      return receivedState; 

    default:
      return state;
  }
};

export default todosReducer;