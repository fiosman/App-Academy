import React from 'react'; 

class BenchForm extends React.Component { 
  constructor() { 
    super(props)
    this.state = { 
      description: '', 
      numSeats = '', 
      latitude: '', 
      longitude: ''
    }
  }

  render() { 
    return ( 
      <form>
        <label>Description: 
          <input type="text" value={this.state.description}/>
        </label>
        <label>Latitude: 
          <input type="text" value={this.state.latitude}/>
        </label>
        <label>Longitude:
          <input type="text" value={this.state.longitude}/>
        </label>
        <label>Number of Seats: 
          <input type="text" value={this.state.numSeats}/>
        </label>
      </form>
    )
  }
}