import React from 'react'; 

class ReviewForm extends React.Component { 
  constructor(props) { 
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      rating: '', 
      description: '', 
    }
  }

  handleChange(e) { 
    
  }

  handleClick(e) { 

  }

  render() { 
    return (
      <form>
        <label>Rating
          <input type="number" name='rating' value={this.state.rating} onChange={this.handleChange}/>
        </label>
        <label>Comment
          <textarea value={this.state.description} name='description' onChange={this.handleChange}></textarea>
        </label>
        <button onClick={this.handleClick}>Submit</button>
        <button onClick={this.handleClick}>Cancel</button>
      </form>
    )
  }
}

export default ReviewForm;