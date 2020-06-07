import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component { 
  constructor(props) { 
    super(props);
    this.state = { searchTerm: '' }; 
  }

  render() { 
    return( 
      <form>
        <input type="text" placeholder="Search for Giphys here..."/>
        <input type="submit" value="Submit"/>
      </form>
    )
  }
}

export default GiphysSearch;