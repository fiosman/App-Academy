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
        <h1>Clock!</h1>
        <p>
          Time: {time.getHours()}:{time.getMinutes()}:{time.getSeconds()}
        </p>
        <p>Date: {time.toDateString()}</p>
      </div>
    );
  }
}

export default Clock;
