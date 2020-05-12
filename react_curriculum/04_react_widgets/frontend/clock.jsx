import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super();
    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({ time: new Date() });
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }

  render() {
    const { time } = this.state;
    return (
      <div>
        <h1>Clock</h1>
        <div className="parent-container">
          <div className="time-container">
            <span>Time:</span>
            <span>
              {time.getHours()}:{time.getMinutes()}:{time.getSeconds()}
            </span>
          </div>
          <div className="date-container">
            <span>Date:</span> <span>{time.toDateString()}</span>
          </div>
        </div>
      </div>
    );
  }
}

export default Clock;
