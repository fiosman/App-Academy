export const fetchTodos = () => { 
  return $.ajax({ 
    url: 'api/todos', 
    method: 'GET'
  });
}
