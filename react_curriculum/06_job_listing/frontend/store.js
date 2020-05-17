import { createStore } from 'redux'; 
import reducer from './reducer.js';

const Store = createStore(reducer); 

export default Store;