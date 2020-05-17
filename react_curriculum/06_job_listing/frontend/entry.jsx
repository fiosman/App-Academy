import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import Store from './store';

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Widget store={Store} />, document.getElementById('root'));
});
